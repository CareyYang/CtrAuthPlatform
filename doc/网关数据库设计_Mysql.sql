/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/12 22:50:27                          */
/*==============================================================*/


drop table if exists AhphConfigReRoutes;

drop table if exists AhphGlobalConfiguration;

drop table if exists AhphReRoute;

drop table if exists AhphReRoutesItem;

/*==============================================================*/
/* Table: AhphConfigReRoutes                                    */
/*==============================================================*/
create table AhphConfigReRoutes
(
   CtgRouteId           int not null auto_increment comment '����·������',
   AhphId               int comment '��������',
   ReRouteId            int comment '·������',
   primary key (CtgRouteId)
);

alter table AhphConfigReRoutes comment '����-·��,�������ö�����غͶ��·��';

/*==============================================================*/
/* Table: AhphGlobalConfiguration                               */
/*==============================================================*/
create table AhphGlobalConfiguration
(
   AhphId               int not null auto_increment comment '��������',
   GatewayName          varchar(100) not null comment '��������',
   RequestIdKey         varchar(100) comment 'ȫ������Ĭ��key',
   BaseUrl              varchar(100) comment '����·�ɸ���ַ',
   DownstreamScheme     varchar(50) comment '����ʹ�üܹ�',
   ServiceDiscoveryProvider varchar(500) comment '������ȫ������,ֵΪ����json',
   LoadBalancerOptions  varchar(500) comment 'ȫ�ָ��ؾ�������',
   HttpHandlerOptions   varchar(500) comment 'Http��������',
   QoSOptions           varchar(200) comment '����ȫ����,��ʱ�����ԡ��۶�',
   IsDefault            int not null default 0 comment '�Ƿ�Ĭ������, 1 Ĭ�� 0 Ĭ��',
   InfoStatus           int not null default 1 comment '��ǰ״̬, 1 ��Ч 0 ��Ч',
   primary key (AhphId)
);

alter table AhphGlobalConfiguration comment '����ȫ�����ñ�';

/*==============================================================*/
/* Table: AhphReRoute                                           */
/*==============================================================*/
create table AhphReRoute
(
   ReRouteId            int not null auto_increment comment '·������',
   ItemId               int comment '��������',
   UpstreamPathTemplate varchar(150) not null comment '����·��ģ�壬֧������',
   UpstreamHttpMethod   varchar(50) not null comment '�������󷽷������ʽ',
   UpstreamHost         varchar(100) comment '����������ַ',
   DownstreamScheme     varchar(50) not null comment '����ʹ�üܹ�',
   DownstreamPathTemplate varchar(200) not null comment '����·��ģ��,�����������Ӧ',
   DownstreamHostAndPorts varchar(500) comment '���������ַ�Ͷ˿�,��̬��������',
   AuthenticationOptions varchar(300) comment '��Ȩ����,�Ƿ���Ҫ��֤����',
   RequestIdKey         varchar(100) comment 'ȫ������Ĭ��key',
   CacheOptions         varchar(200) comment '��������,���ò�ѯ���ٴ����û���',
   ServiceName          varchar(100) comment '����������,���÷�����ʱ��Ч',
   LoadBalancerOptions  varchar(500) comment 'ȫ�ָ��ؾ�������',
   QoSOptions           varchar(200) comment '����ȫ����,��ʱ�����ԡ��۶�',
   DelegatingHandlers   varchar(200) comment 'ί�д�����,�ض�·�ɶ���ί�е�������',
   Priority             int comment '·�����ȼ�,���·��ƥ���ϣ����ȼ��ߵ���ִ��',
   InfoStatus           int not null default 1 comment '��ǰ״̬, 1 ��Ч 0 ��Ч',
   primary key (ReRouteId)
);

alter table AhphReRoute comment '·�����ñ�';

/*==============================================================*/
/* Table: AhphReRoutesItem                                      */
/*==============================================================*/
create table AhphReRoutesItem
(
   ItemId               int not null auto_increment comment '��������',
   ItemName             varchar(100) not null comment '��������',
   ItemDetail           varchar(500) comment '��������',
   ItemParentId         int comment '�ϼ�����,�����ڵ�Ϊ��',
   InfoStatus           int not null default 1 comment '��ǰ״̬, 1 ��Ч 0 ��Ч',
   primary key (ItemId)
);

alter table AhphReRoutesItem comment '·�ɷ����';

alter table AhphConfigReRoutes add constraint FK_Relationship_4 foreign key (AhphId)
      references AhphGlobalConfiguration (AhphId) on delete restrict on update restrict;

alter table AhphConfigReRoutes add constraint FK_Relationship_5 foreign key (ReRouteId)
      references AhphReRoute (ReRouteId) on delete restrict on update restrict;

alter table AhphReRoute add constraint FK_����·����Ϣ foreign key (ItemId)
      references AhphReRoutesItem (ItemId) on delete restrict on update restrict;

