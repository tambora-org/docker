--liquibase formatted sql
	
/* initial test */
--comment: some comment
			
--changeset nvoxland:1
create table test1 (  
    id int primary key,
    name varchar(255)  
);  
/* each rollback line must be prefixed with --rollback, splitting is possible
   https://stackoverflow.com/questions/47316948/liquibase-multi-line-sql-rollback-using-rollbacksplitstatements-and-rollbacken  
*/
--rollback drop table test1; 

--changeset nvoxland:2 
insert into test1 (id, name) values (1, 'name 1');
insert into test1 (id,  name) values (2, 'name 2');  




