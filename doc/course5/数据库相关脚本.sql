--1��������������
INSERT INTO AhphLimitRule VALUES('ÿ1���ӷ���1��','1m',1,1);
INSERT INTO AhphLimitRule VALUES('ÿ1���ӷ���60��','1m',60,1);

--2��Ӧ�õ�/cjy/values·��
INSERT INTO AhphReRouteLimitRule VALUES(1,1);
INSERT INTO AhphReRouteLimitRule VALUES(2,1);

--3��������Է���
INSERT INTO AhphLimitGroup VALUES('��������1','',1);
INSERT INTO AhphLimitGroup VALUES('��������2','',1);
--4������Ӧ�ò���
INSERT INTO AhphLimitGroupRule VALUES(1,1);
INSERT INTO AhphLimitGroupRule VALUES(2,2);

--5���ͻ���Ӧ����������
INSERT INTO AhphClientLimitGroup VALUES(2,1);
INSERT INTO AhphClientLimitGroup VALUES(3,2);

--6�����ÿͻ���1/cjy/values·�ɰ�����
INSERT INTO AhphClientReRouteWhiteList VALUES(1,2);