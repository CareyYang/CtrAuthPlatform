--����ȫ�ֲ�����Ϣ
insert into AhphGlobalConfiguration(GatewayName,RequestIdKey,IsDefault,InfoStatus)
values('��������','test_gateway',1,1);

--����·�ɷ��������Ϣ
insert into AhphReRoutesItem(ItemName,InfoStatus) values('���Է���',1);

--����·�ɲ�����Ϣ 
insert into AhphReRoute values(1,'/ctr/values','[ "GET" ]','','http','/api/Values','[{"Host": "localhost","Port": 9000 }]',
'','','','','','','',0,1);

--�������ع�����
insert into dbo.AhphConfigReRoutes values(1,1);
