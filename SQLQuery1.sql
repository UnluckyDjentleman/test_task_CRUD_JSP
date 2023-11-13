create table COUNTRIES (COUNTRY_ID char(2) primary key, COUNTRY_NAME varchar2(4000), COUNTRY_FLAG varchar2(200));
insert into COUNTRIES values ('PR','Portugal','portugal.png'),
('NR','Norway','norway.png'),
('SE','Slovenia','slovenia.png'),
('CR','Croatia', 'croatia.png'),
('HU','Hungary','hungary.png'),
('AU','Austria','austria.png');
commit;

create or replace procedure GetAllCountries (cur out sys_refcursor)
as
begin
open cur for select * from COUNTRIES;
end GetAllCountries;

declare 
    l_cur sys_refcursor;
begin
call GetAllCountries(l_cur);
end;

drop procedure GetAllCountries;

CREATE OR REPLACE DIRECTORY DIR AS '$ORACLE_HOME/xml_oracle';
GRANT ALL on directory DIR to sys;
commit;


create or replace procedure XMLImport
is
begin
insert into COUNTRIES
SELECT ExtractValue(VALUE(COUNTRIES), '//COUNTRY_ID') AS country_id, 
       ExtractValue(VALUE(COUNTRIES), '//COUNTRY_NAME') AS country_name ,
       ExtractValue(VALUE(COUNTRIES), '//COUNTRY_FLAG') AS country_flag

FROM TABLE(XMLSequence(EXTRACT(XMLTYPE(bfilename('DIR', 'COUNTRIES_import.xml'), 
           nls_charset_id('UTF-8')),'/ROWSET/ROW'))) COUNTRIES; 
end XMLImport;

select dbms_lob.getlength(country_id) from COUNTRIES;

insert into COUNTRIES values ('PL','Poland','poland.svg');

create or replace procedure XMLExport
is  
rc sys_refcursor; 
doc DBMS_XMLDOM.DOMDocument; 
begin 
OPEN rc FOR  
SELECT country_id, country_name,country_flag FROM COUNTRIES; 
doc := DBMS_XMLDOM.NewDOMDocument(XMLTYPE(rc)); 
DBMS_XMLDOM.WRITETOFILE(doc, 'DIR/COUNTRIES_export.xml'); 
commit; 
exception 
when others then 
raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);       
end XMLExport;

begin
XMLImport();
end;

--VERY IMPORTANT STRING!!!!!
alter session set "_ORACLE_SCRIPT"=true;

--don't give a shit it is for stems

create table docs (id number not null, text varchar2(1000) not null);
insert into docs values (1, 'Ўла —аша по шоссе и сосала сушку.');
insert into docs values (3, 'The purpose of management is to coordinate and organize many operations of organization so that those actions may contribute to the company achieving its goals.');


create index docs_idx on docs (text) indextype is ctxsys.context parameters('WORDLIST my_wordlist');

drop index docs_idx;

select * from docs where contains(text, '?management') > 0;


elect * from dba_

create index myindex_for_countries on COUNTRIES(COUNTRY_NAME) 
  indextype is ctxsys.context;

select * from COUNTRIES where contains(country_name, 'Po%') > 0;

select * from COUNTRIES where contains(country_name, '$Polonia')>0;

drop index myindex_for_countries;

ALTER SYSTEM SET MAX_STRING_SIZE=EXTENDED SCOPE=SPFILE;

select country_name from COUNTRIES where contains(country_name,'Po%')>0;

select country_name from COUNTRIES where contains(country_name,'Sweden')>0;

begin
XMLExport();
end;

select * from countries;

delete from COUNTRIES where country_id='BL';
commit;

drop table COUNTRIES;
delete from COUNTRIES;