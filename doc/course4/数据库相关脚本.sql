--������Կͻ���
INSERT INTO AhphClients(ClientId,ClientName) VALUES('client1','���Կͻ���1')
INSERT INTO AhphClients(ClientId,ClientName) VALUES('client2','���Կͻ���2')
--���������Ȩ��
INSERT INTO AhphAuthGroup VALUES('��Ȩ��1','ֻ�ܷ���/cjy/values·��',1);
INSERT INTO AhphAuthGroup VALUES('��Ȩ��2','�ܷ�������·��',1);
--���������Ȩ��
INSERT INTO AhphReRouteGroupAuth VALUES(1,1);

INSERT INTO AhphReRouteGroupAuth VALUES(2,1);
INSERT INTO AhphReRouteGroupAuth VALUES(2,2);

--����ͻ�����Ȩ
INSERT INTO AhphClientGroup VALUES(3,1);
INSERT INTO AhphClientGroup VALUES(2,2);

--���ò���·��ֻ����Ȩ���ܷ���
UPDATE AhphReRoute SET AuthenticationOptions='{"AuthenticationProviderKey": "TestKey"}' WHERE ReRouteId IN(1,2);

SELECT * FROM dbo.AhphClients
