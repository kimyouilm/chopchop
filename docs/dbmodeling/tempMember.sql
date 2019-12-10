/*
 * 임시 멤버 만드는 sql문
 */
insert into 
  member (email, password, nickname, tel, grade)
value ('admin@test.com', password('1111'), 'admin', '01011111111', 0);

insert into 
  member (email, password, nickname, tel)
value ('test1@test.com', password('1111'), 'test1', '01011111111');

insert into 
  member (email, password, nickname, tel)
value ('test2@test.com', password('1111'), 'test2', '01022222222');

insert into 
  member (email, password, nickname, tel)
value ('test3@test.com', password('1111'), 'test3', '01033333333');

insert into 
  member (email, password, nickname, tel)
value ('test4@test.com', password('1111'), 'test4', '01044444444');

insert into 
  member (email, password, nickname, tel)
value ('test5@test.com', password('1111'), 'test5', '01055555555');
