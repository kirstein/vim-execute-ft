# Execute filetype specific commands 

> Allows easily binding a single key for multiple filetypes to execute different actions. 

## Why?

With vim it's quite annoying to map a single key to do different actions according to the current filetype.

Its possible using `autocmd`, but that will get old fast. Especially if you are dealing with multiple languages.

This plugin allows users to define execute commands as a dictionary. 

## Install

 I recommend using a plugin manager to do the grunt work for you.
 If for some reason, you do not want to use any of them, then unzip the contents of the .zip file to your ~/.vim directory.

## Usage

Define filetype specific commands using `g:execute_ft_commands`

```
let g:execute_ft_commands = {
  \'<filetype>': { '<command type>': '<command>'}
\}
```

Patterns:  

  - `{file}` will be replaced as fullpath of the file

calling `ExecuteByFt` with the `command type` will execute the specific command for that filetype. Simple stuff.

## Example

```vim
let g:execute_ft_commands = { 
  \'javascript': { 'all': 'Dispatch npm test', 'single': 'Dispatch npm test -- {file}' },
  \'ruby': { 'all': 'Rake spec test', 'single': 'Rake spec SPEC={file}' }
\}

map <silent> \a :call ExecuteByFT("all")<CR>
map <silent> \t :call ExecuteByFT("single")<CR>
map <silent> \\ :call ExecuteByFtLast()<CR>
```

## Commands

  - `ExecuteByFT(<type>)` - execute filetype command by its type
  - `ExecuteFtLast()` - execute the last command
