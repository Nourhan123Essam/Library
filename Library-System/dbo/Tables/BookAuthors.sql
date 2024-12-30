-- (Many-to-Many Relationship)
CREATE TABLE [dbo].[BookAuthors] (
    [BookId]   INT NOT NULL,
    [AuthorId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([BookId] ASC, [AuthorId] ASC),
    CONSTRAINT [FK_BookAuthors_Authors] FOREIGN KEY ([AuthorId]) REFERENCES [dbo].[Authors] ([AuthorID]) ON DELETE CASCADE,
    CONSTRAINT [FK_BookAuthors_Books] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([BookId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_AuthorId]
    ON [dbo].[BookAuthors]([AuthorId] ASC);

