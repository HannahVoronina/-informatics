program project1;

type
  user_data = record
    time: integer;
    id: integer;
    enters: integer;
    isChanged: boolean;
  end;

var
  files: array of text;
  fname: string;
  n_files: integer;
  end_file: text;
  users: array of user_data;
  program_end: boolean;
  max_enters: integer;
  i: integer;

begin
  Write('Input files count: ');
  ReadLn(n_files);
  SetLength(files, n_files);
  SetLength(users, n_files);
  program_end := false;
  for i := 1 to n_files do
  begin

    WriteLn('Enter file name ', i, ': ');
    ReadLn(fname);
    assign(files[i - 1], fname);
    reset(files[i - 1]);
    users[i - 1].isChanged := true;
  end;

  assign(end_file, 'end_file.txt');
  ReWrite(end_file);
  while true do
  begin

    program_end := true;

    for i := 0 to n_files - 1 do
    begin

      if not EOF(files[i]) then
        if users[i].isChanged then
        begin
          Read(files[i], users[i].time);
          Read(files[i], users[i].id);
          Read(files[i], users[i].enters);
          users[i].isChanged := false;
        end;

      if (not users[i].isChanged) then
        program_end := false;

    end;
    if program_end then
      break;
    max_enters := -1;

    for i := 0 to n_files - 1 do
      if (not users[i].isChanged) and ((users[i].enters > users[max_enters].enters) or (max_enters = -1))  then
        max_enters := i;

    Write(end_file, users[max_enters].time, ' ');
    Write(end_file, users[max_enters].id, ' ');
    WriteLn(end_file, users[max_enters].enters, ' ');
    users[max_enters].isChanged := true;
  end;

  for i := 0 to n_files - 1 do
    Close(files[i]);
  Close(end_file);

  WriteLn('Output file is ', 'end_file.txt');
  WriteLn('Finished!');
  ReadLn();
end.
