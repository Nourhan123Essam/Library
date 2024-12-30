CREATE TABLE [dbo].[Books] (
    [BookId]      INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (200) NOT NULL,
    [ISBN]        NVARCHAR (13)  NOT NULL,
    [Quantity]    INT            NULL,
    [CategoryId]  INT            NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([BookId] ASC),
    CHECK ([Quantity]>=(0)),
    CONSTRAINT [FK_Books_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId]) ON DELETE CASCADE,
    UNIQUE NONCLUSTERED ([ISBN] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_CategoryId]
    ON [dbo].[Books]([CategoryId] ASC);

