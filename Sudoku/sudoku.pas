program sudoku;

uses
  strings,
  wincrt;

type
  short = 1..9;
var
  j, n, l, o, p, q, limk1, limk2, limi1, limi2: short;
  ch:      String[1];
  x, y, no1, no2, i, s, k: Integer;
  b, t, v: Boolean;
  key, yn: Char;
  M:       array [1..9, 1..9] of String[1];
  xy:      array [1..2, 1..81] of Integer;
  cht:     array [1..6] of String[4];
label
  theend, randoms, repeatative1, repeatative2, saisir, game;
begin

  strcopy(windowtitle, 'Sudoku Game By Sameur.B.H (CrYmFoX) Version 1');

  gotoxy(11, 11);
  Write('*Welcome to Sudoku Game!*');
  gotoxy(11, 12);
  Write('(Press ENTER to start...)');
  gotoxy(56, 11);
  Write('�������');
  gotoxy(56, 12);
  Write('�     �');
  gotoxy(56, 13);
  Write('�     �');
  gotoxy(56, 14);
  Write('�������');
  gotoxy(9, 24);
  Write('All rights reserved to CrYmFoX 2016.');
  gotoxy(10, 22);
  Write('Created By Sameur Ben Hmouda.');
  repeat
    gotoxy(59, 12);
    yn := readkey;
  until yn = chr(13);

  game:

    clrscr;


  writeln(' _____________________________________________________ ');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');
  writeln('|     |     |     |     |     |     |     |     |     |');
  writeln('|_____|_____|_____|_____|_____|_____|_____|_____|_____|');

  gotoxy(60, 3);
  Write('+Instructions+');
  gotoxy(57, 5);
  Write('*Keys to move:');
  gotoxy(58, 6);
  Write('Up=Z / Down=S / Left=Q');
  gotoxy(58, 7);
  Write('/ Right=D.');
  gotoxy(57, 9);
  Write('*Enter numbers from');
  gotoxy(58, 10);
  Write('1 to 9 and press');
  gotoxy(58, 11);
  Write('"Space" to erase.');
  gotoxy(57, 13);
  Write('-----------------------');
  gotoxy(57, 15);
  Write('*Press "P" to exit.');
  gotoxy(57, 17);
  Write('-----------------------');
  gotoxy(63, 19);
  Write('Enjoy! ^-^');

  for i := 1 to 6 do
    cht[i] := '';

  repeatative2:
    for k := 1 to 9 do
      for i := 1 to 9 do
        M[i, k] := ' ';

  randomize;
  for k := 1 to 9 do begin
    if k in [1..3] then begin
      limk1 := 1;
      limk2 := 3;
    end else
    if k in [4..6] then begin
      limk1 := 4;
      limk2 := 6;
    end else begin
      limk1 := 7;
      limk2 := 9;
    end;

    no2   := 0;
    repeatative1:
      no2 := no2 + 1;
    for i := 1 to 9 do begin
      if i in [1..3] then begin
        limi1 := 1;
        limi2 := 3;
      end else
      if i in [4..6] then begin
        limi1 := 4;
        limi2 := 6;
      end else begin
        limi1 := 7;
        limi2 := 9;
      end;

      no1   := 0;
      randoms:
        no1 := no1 + 1;
      str(random(9) + 1, ch);
      b := True;
      for j := 1 to 9 do
        b := b and (ch <> M[j, k]);
      for l := 1 to 9 do
        b := b and (ch <> M[i, l]);
      for p := limk1 to limk2 do
        for q := limi1 to limi2 do
          b := b and (ch <> M[q, p]);
      if b = True then
        M[i, k] := ch
      else begin
        if no1 = 100 then begin
          for o := 1 to 9 do
            M[o, k] := ' ';
          if no2 <> 100 then
            goto repeatative1
          else
            goto repeatative2;
        end;
        goto randoms;
      end;
    end;
  end;

  for i := 1 to 38 do begin
    limi1           := random(9) + 1;
    limi2           := random(9) + 1;
    M[limi1, limi2] := ' ';
  end;


  x := 4;
  for k := 1 to 9 do begin
    y := 2;
    for i := 1 to 9 do begin
      gotoxy(x, y);
      Write(M[i, k]);
      y := y + 2;
    end;
    x := x + 6;
  end;

  s := 0;
  for k := 1 to 9 do
    for i := 1 to 9 do
      if M[i, k] <> ' ' then begin
        s        := s + 1;
        xy[1, s] := (k - 1) * 6 + 4;
        xy[2, s] := (i - 1) * 2 + 2;
      end;


  x := 28;
  y := 10;
  gotoxy(x, y);
  saisir:

    key := readkey;
  case key of
    'z':
    begin
      gotoxy(2, 22);
      Write('                                                   ');
      y := y - 2;
    end;
    's':
    begin
      gotoxy(2, 22);
      Write('                                                   ');
      y := y + 2;
    end;
    'd':
    begin
      gotoxy(2, 22);
      Write('                                                   ');
      x := x + 6;
    end;
    'q':
    begin
      gotoxy(2, 22);
      Write('                                                   ');
      x := x - 6;
    end;
    'p': goto TheEnd;
    ' ':
    begin
      gotoxy(2, 22);
      Write('                                                   ');

      b := False;
      for k := 1 to 81 do begin
        str(xy[1, k], cht[1]);
        str(xy[2, k], cht[2]);
        cht[3] := concat(cht[1], cht[2]);
        str(x, cht[4]);
        str(y, cht[5]);
        cht[6] := concat(cht[4], cht[5]);
        b      := b or (cht[3] = cht[6]);
      end;
      if b = False then begin
        M[((y - 2) div 2) + 1, ((x - 4) div 6) + 1] := key;
        gotoxy(x, y);
        Write(' ');
        gotoxy(x, y);
      end;
    end;
    '1' .. '9':
    begin
      gotoxy(2, 22);
      Write('                                                   ');
      b := False;
      for k := 1 to 81 do begin
        str(xy[1, k], cht[1]);
        str(xy[2, k], cht[2]);
        cht[3] := concat(cht[1], cht[2]);
        str(x, cht[4]);
        str(y, cht[5]);
        cht[6] := concat(cht[4], cht[5]);
        b      := b or (cht[3] = cht[6]);
      end;
      if ((x - 4) div 6) + 1 in [1..3] then begin
        limk1 := 1;
        limk2 := 3;
      end else
      if ((x - 4) div 6) + 1 in [4..6] then begin
        limk1 := 4;
        limk2 := 6;
      end else begin
        limk1 := 7;
        limk2 := 9;
      end;
      if ((y - 2) div 2) + 1 in [1..3] then begin
        limi1 := 1;
        limi2 := 3;
      end else
      if ((y - 2) div 2) + 1 in [4..6] then begin
        limi1 := 4;
        limi2 := 6;
      end else begin
        limi1 := 7;
        limi2 := 9;
      end;
      t := True;
      for j := 1 to 9 do
        t := t and (key <> M[j, ((x - 4) div 6) + 1]);
      for l := 1 to 9 do
        t := t and (key <> M[((y - 2) div 2) + 1, l]);
      for s := limk1 to limk2 do
        for o := limi1 to limi2 do
          t := t and (key <> M[o, s]);


      if (b = False) and (t = True) then begin
        M[((y - 2) div 2) + 1, ((x - 4) div 6) + 1] := key;
        gotoxy(x, y);
        Write(key);
        gotoxy(x, y);
      end;
      if (b = False) and (t = False) then
        if key = M[((y - 2) div 2) + 1, ((x - 4) div 6) + 1] then begin
          gotoxy(x, y);
          gotoxy(2, 22);
          Write('#You already entered this number!#');
          gotoxy(x, y);
        end else begin
          gotoxy(x, y);
          gotoxy(2, 22);
          Write('#The number you entered is not correct, try again#');
          gotoxy(x, y);
        end;
    end;
  end;

  for i := 1 to 6 do
    Delete(cht[i], 1, length(cht[i]));

  case y of
    0: y  := 2;
    20: y := 18;
  end;
  case x of
    -2: x := 4;
    58: x := 52;
  end;

  gotoxy(x, y);

  v := True;
  for k := 1 to 9 do
    for i := 1 to 9 do
      v := v and (M[i, k] <> ' ');

  if v = False then
    goto saisir
  else begin
    clrscr;
    gotoxy(17, 11);
    Write('Excellent! You have solved the puzzle!');
    gotoxy(17, 13);
    Write('Would you like to play again? (Y/N)... < >');
    repeat
      gotoxy(57, 13);
      yn := readkey;
    until (upcase(yn) = 'Y') or (upcase(yn) = 'N');
    Write(yn);
    if upcase(yn) = 'Y' then
      goto game
    else begin
      gotoxy(15, 22);
      Write('You chose to quit the game, please press ENTER...');
      repeat
        gotoxy(64, 22);
        yn := readkey;
      until yn = chr(13);
      donewincrt;
    end;
  end;



  TheEnd:
    clrscr;
  gotoxy(20, 16);
  Write('The game is over, please press ENTER... ');
  repeat
    gotoxy(59, 16);
    yn := readkey;
  until yn = chr(13);
  donewincrt;

end.
