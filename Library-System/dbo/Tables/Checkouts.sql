CREATE TABLE [dbo].[Checkouts] (
    [CheckoutId]   INT           IDENTITY (1, 1) NOT NULL,
    [ReaderId]     INT           NOT NULL,
    [CheckoutDate] DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [DueDate]      DATETIME2 (7) NOT NULL,
    [ReturnDate]   DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([CheckoutId] ASC),
    CONSTRAINT [FK_Checkouts_Readers] FOREIGN KEY ([ReaderId]) REFERENCES [dbo].[Readers] ([ReaderId]) ON DELETE CASCADE
);


GO
create   trigger preventBorrowWhenHaveNotReturnedCheckouts
on Checkouts
after insert
as
begin
	declare @count int = (
		select count(*)
		from Checkouts c  join inserted i
		on c.ReaderId = i.ReaderId
		where c.ReturnDate is NULL
	)
	if(@count > 0)
	begin
		select 'Not Allowed to borrow if you still have a fine not payed'
		rollback
	end

end