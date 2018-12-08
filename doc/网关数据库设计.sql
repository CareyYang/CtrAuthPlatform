/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018/11/12 22:50:58                          */
/*==============================================================*/


if exists (select 1
            from  sysindexes
           where  id    = object_id('AhphConfigReRoutes')
            and   name  = 'Relationship_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index AhphConfigReRoutes.Relationship_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AhphConfigReRoutes')
            and   name  = 'Relationship_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index AhphConfigReRoutes.Relationship_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AhphConfigReRoutes')
            and   type = 'U')
   drop table AhphConfigReRoutes
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AhphGlobalConfiguration')
            and   type = 'U')
   drop table AhphGlobalConfiguration
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AhphReRoute')
            and   name  = '����·����Ϣ_FK'
            and   indid > 0
            and   indid < 255)
   drop index AhphReRoute.����·����Ϣ_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AhphReRoute')
            and   type = 'U')
   drop table AhphReRoute
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AhphReRoutesItem')
            and   type = 'U')
   drop table AhphReRoutesItem
go

/*==============================================================*/
/* Table: AhphConfigReRoutes                                    */
/*==============================================================*/
create table AhphConfigReRoutes (
   CtgRouteId           int                  identity,
   AhphId               int                  null,
   ReRouteId            int                  null,
   constraint PK_AHPHCONFIGREROUTES primary key nonclustered (CtgRouteId)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����-·��,�������ö�����غͶ��·��',
   'user', @CurrentUser, 'table', 'AhphConfigReRoutes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����·������',
   'user', @CurrentUser, 'table', 'AhphConfigReRoutes', 'column', 'CtgRouteId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphConfigReRoutes', 'column', 'AhphId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '·������',
   'user', @CurrentUser, 'table', 'AhphConfigReRoutes', 'column', 'ReRouteId'
go

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/
create index Relationship_4_FK on AhphConfigReRoutes (
AhphId ASC
)
go

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create index Relationship_5_FK on AhphConfigReRoutes (
ReRouteId ASC
)
go

/*==============================================================*/
/* Table: AhphGlobalConfiguration                               */
/*==============================================================*/
create table AhphGlobalConfiguration (
   AhphId               int                  identity,
   GatewayName          varchar(100)         not null,
   RequestIdKey         varchar(100)         null,
   BaseUrl              varchar(100)         null,
   DownstreamScheme     varchar(50)          null,
   ServiceDiscoveryProvider varchar(500)         null,
   LoadBalancerOptions  varchar(500)         null,
   HttpHandlerOptions   varchar(500)         null,
   QoSOptions           varchar(200)         null,
   IsDefault            int                  not null default 0,
   InfoStatus           int                  not null default 1,
   constraint PK_AHPHGLOBALCONFIGURATION primary key nonclustered (AhphId)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����ȫ�����ñ�',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'AhphId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'GatewayName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ȫ������Ĭ��key',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'RequestIdKey'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����·�ɸ���ַ',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'BaseUrl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����ʹ�üܹ�',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'DownstreamScheme'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '������ȫ������,ֵΪ����json',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'ServiceDiscoveryProvider'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ȫ�ָ��ؾ�������',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'LoadBalancerOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Http��������',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'HttpHandlerOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����ȫ����,��ʱ�����ԡ��۶�',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'QoSOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�Ƿ�Ĭ������, 1 Ĭ�� 0 Ĭ��',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'IsDefault'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��ǰ״̬, 1 ��Ч 0 ��Ч',
   'user', @CurrentUser, 'table', 'AhphGlobalConfiguration', 'column', 'InfoStatus'
go

/*==============================================================*/
/* Table: AhphReRoute                                           */
/*==============================================================*/
create table AhphReRoute (
   ReRouteId            int                  identity,
   ItemId               int                  null,
   UpstreamPathTemplate varchar(150)         not null,
   UpstreamHttpMethod   varchar(50)          not null,
   UpstreamHost         varchar(100)         null,
   DownstreamScheme     varchar(50)          not null,
   DownstreamPathTemplate varchar(200)         not null,
   DownstreamHostAndPorts varchar(500)         null,
   AuthenticationOptions varchar(300)         null,
   RequestIdKey         varchar(100)         null,
   CacheOptions         varchar(200)         null,
   ServiceName          varchar(100)         null,
   LoadBalancerOptions  varchar(500)         null,
   QoSOptions           varchar(200)         null,
   DelegatingHandlers   varchar(200)         null,
   Priority             int                  null,
   InfoStatus           int                  not null default 1,
   constraint PK_AHPHREROUTE primary key nonclustered (ReRouteId)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '·�����ñ�',
   'user', @CurrentUser, 'table', 'AhphReRoute'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '·������',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'ReRouteId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'ItemId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����·��ģ�壬֧������',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'UpstreamPathTemplate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�������󷽷������ʽ',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'UpstreamHttpMethod'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����������ַ',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'UpstreamHost'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����ʹ�üܹ�',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'DownstreamScheme'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����·��ģ��,�����������Ӧ',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'DownstreamPathTemplate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '���������ַ�Ͷ˿�,��̬��������',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'DownstreamHostAndPorts'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��Ȩ����,�Ƿ���Ҫ��֤����',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'AuthenticationOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ȫ������Ĭ��key',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'RequestIdKey'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������,���ò�ѯ���ٴ����û���',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'CacheOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����������,���÷�����ʱ��Ч',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'ServiceName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ȫ�ָ��ؾ�������',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'LoadBalancerOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '����ȫ����,��ʱ�����ԡ��۶�',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'QoSOptions'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ί�д�����,�ض�·�ɶ���ί�е�������',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'DelegatingHandlers'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '·�����ȼ�,���·��ƥ���ϣ����ȼ��ߵ���ִ��',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'Priority'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��ǰ״̬, 1 ��Ч 0 ��Ч',
   'user', @CurrentUser, 'table', 'AhphReRoute', 'column', 'InfoStatus'
go

/*==============================================================*/
/* Index: ����·����Ϣ_FK                                             */
/*==============================================================*/
create index ����·����Ϣ_FK on AhphReRoute (
ItemId ASC
)
go

/*==============================================================*/
/* Table: AhphReRoutesItem                                      */
/*==============================================================*/
create table AhphReRoutesItem (
   ItemId               int                  identity,
   ItemName             varchar(100)         not null,
   ItemDetail           varchar(500)         null,
   ItemParentId         int                  null,
   InfoStatus           int                  not null default 1,
   constraint PK_AHPHREROUTESITEM primary key nonclustered (ItemId)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '·�ɷ����',
   'user', @CurrentUser, 'table', 'AhphReRoutesItem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphReRoutesItem', 'column', 'ItemId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphReRoutesItem', 'column', 'ItemName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��������',
   'user', @CurrentUser, 'table', 'AhphReRoutesItem', 'column', 'ItemDetail'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '�ϼ�����,�����ڵ�Ϊ��',
   'user', @CurrentUser, 'table', 'AhphReRoutesItem', 'column', 'ItemParentId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '��ǰ״̬, 1 ��Ч 0 ��Ч',
   'user', @CurrentUser, 'table', 'AhphReRoutesItem', 'column', 'InfoStatus'
go

