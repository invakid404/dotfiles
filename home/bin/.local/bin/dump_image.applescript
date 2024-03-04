on run argv
    -- Get the first argument as the file path
    set filePath to POSIX file (item 1 of argv)
    
    -- Get the image from the clipboard
    set theClipboard to the clipboard as «class PNGf»
    
    -- Open the file for writing
    set fileRef to open for access filePath with write permission
    
    -- Write the image data to the file
    write theClipboard to fileRef
    
    -- Close the file
    close access fileRef
end run
