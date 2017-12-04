insert into F_UNITINFO
(UNIT_CODE, PARENT_UNIT, UNIT_TYPE, IS_VALID, UNIT_TAG,
UNIT_NAME, ENGLISH_NAME, DEP_NO, UNIT_DESC, ADDRBOOK_ID,
UNIT_SHORT_NAME, UNIT_WORD, UNIT_GRADE, UNIT_ORDER, UPDATE_DATE,
CREATE_DATE, EXTJSONINFO, CREATOR, UPDATOR, UNIT_PATH)
values
('U00001', null, 'N', 'T', null,
'根机构', 'root', null, '根机构', null,
'root', null, null, 1, sysdate,
sysdate, null, 'u0000000', 'u0000000', '/U00001');

insert into F_USERINFO (USER_CODE, USER_PIN, IS_VALID, LOGIN_NAME, USER_NAME, USER_DESC, LOGIN_TIMES, ACTIVE_TIME, LOGIN_IP, ADDRBOOK_ID, REG_EMAIL, USER_ORDER, USER_PWD, REG_CELL_PHONE, CREATE_DATE,CREATOR,UPDATOR,UPDATE_DATE)
values ('noname', '67b74fe1423796dfe8db34b959b81fbd', 'F', 'noname', '匿名用户', '匿名用户', null, null, '', null, 'noname@centit.com', 1, '', '', sysdate,'u0000000','u0000000',sysdate);
insert into F_USERINFO (USER_CODE, USER_PIN, IS_VALID, LOGIN_NAME, USER_NAME, USER_DESC, LOGIN_TIMES, ACTIVE_TIME, LOGIN_IP, ADDRBOOK_ID, REG_EMAIL, USER_ORDER, USER_PWD, REG_CELL_PHONE, CREATE_DATE ,CREATOR,UPDATOR,UPDATE_DATE,primary_Unit)
values ('u0000000', '$2a$11$DbyFNhHeCES5CKoMuM5sXepY7GM35sZkUSqQbjYJnFTzJ2GDIYGLK', 'T', 'admin', '管理员', '', null, null, '', null, 'codefan@centit.com', 1, '', '18017458877', sysdate,'u0000000','u0000000',sysdate,'U00001');

INSERT INTO F_USERUNIT(USER_UNIT_ID, UNIT_CODE, USER_CODE, Is_Primary, User_Station, User_Rank, Rank_Memo, User_Order,
update_Date, Create_Date) VALUES ('s000000000','U00001','u0000000','T','pf','CZ',null,'1',sysdate,sysdate);

-- 初始化数据字典
INSERT INTO f_datacatalog VALUES ('CatalogStyle', '字典类型', 'F', 'L', 'F : 框架固有的 U:用户 S：系统', '{\"dataCode\":{\"value\":\"类型编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"类型说明\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"扩展编码2\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'DICTSET_M', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('CatalogType', '字典结构', 'F', 'L', 'L:列表T:树形 测试修改', '{\"dataCode\":{\"value\":\"结构编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"结构名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"排序\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'DICTSET_M', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('FlowUserRole', '工作流流程角色', 'S', 'L', '', '{\"dataCode\":{\"value\":\"角色编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"角色名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"扩展编码2\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'SYS_CONFIG', '1', null, null);
INSERT INTO f_datacatalog VALUES ('LogLevel', '日志类型', 'F', 'L', '日志类型', '{\"dataCode\":{\"value\":\"类型编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"类型名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"扩展编码2\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'OPT_LOG_QUERY', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('MsgType', '消息类型', 'F', 'L', '测试测试', '{\"dataCode\":{\"value\":\"类型编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"类型名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"扩展编码2\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'USER_SETTING', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('OptType', '业务类别', 'F', 'L', '业务类别', '{\"dataCode\":{\"value\":\"类别编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"类别名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"排序\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'SYSCONF', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('RankType', '行政职务类别', 'S', 'L', '业务职务类别，类别代码长度为2。数值越低等级越高', '{\"dataCode\":{\"value\":\"职务代码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"职务名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"等级\",\"isUse\":\"T\"},\"extraCode2\":{\"value\":\"关联角色\",\"isUse\":\"T\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'SYS_CONFIG', '0', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('StationType', '岗位角色', 'S', 'L', '业务岗位类别，类别代码长度为4', '{\"dataCode\":{\"value\":\"岗位编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"岗位名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"关联角色\",\"isUse\":\"T\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'USERUNIT', '0', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('SUPPORT_LANG', '系统支持的语言', 'S', 'L', '系统支持的语言,需要在system.properties中把参数sys.multi_lang设置为true才会生效', null, null, null, 'DICTSET', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('UnitType', '机构类别', 'S', 'L', '', '{\"dataCode\":{\"value\":\"类别编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"类别名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"排序\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'ORGMAG', '1', null, null);
INSERT INTO f_datacatalog VALUES ('userSettingKey', '用户设置参数', 'S', 'L', '用户可以设置的参数', '{\"dataCode\":{\"value\":\"参数编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"参数名称\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"排序\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"参数填写说明\",\"isUse\":\"T\"}}', null, null, 'DICTSET_M', '1', 'u0000000', 'u0000000');
INSERT INTO f_datacatalog VALUES ('YesOrNo', '是否', 'F', 'L', '', '{\"dataCode\":{\"value\":\"编码\",\"isUse\":\"T\"},\"dataValue\":{\"value\":\"数值\",\"isUse\":\"T\"},\"extraCode\":{\"value\":\"扩展编码\",\"isUse\":\"F\"},\"extraCode2\":{\"value\":\"排序\",\"isUse\":\"F\"},\"dataTag\":{\"value\":\"数据标记\",\"isUse\":\"F\"},\"dataDesc\":{\"value\":\"数据描述\",\"isUse\":\"T\"}}', null, null, 'SYS_CONFIG', '1', 'u0000000', 'u0000000');




INSERT INTO f_datadictionary VALUES ('CatalogStyle', 'F', null, null, 'T', '框架固有', 'F', '任何地方都不允许编辑，只能有开发人员给出更新脚本添加、更改和删除', null, null, '0');
INSERT INTO f_datadictionary VALUES ('CatalogStyle', 'G', null, null, 'T', '国标', 'F', '这个暂时不考虑可以在字典类别中进行描述', null, null, '1');
INSERT INTO f_datadictionary VALUES ('CatalogStyle', 'S', null, null, 'T', '系统参数', 'F', '实施人员可以在实施入口对数据字典的类别和字典条目进行CRUD操作', null, null, '2');
INSERT INTO f_datadictionary VALUES ('CatalogStyle', 'U', null, null, 'T', '用户参数', 'F', '管理员入口 和 实施人员入口 都 对这类别字典类别和条目进行CRUD', null, null, '3');
INSERT INTO f_datadictionary VALUES ('CatalogType', 'L', null, null, 'T', '列表', 'F', '列表', null, null, '0');
INSERT INTO f_datadictionary VALUES ('CatalogType', 'T', null, null, 'T', '树形', 'F', '树形', null, null, '1');
INSERT INTO f_datadictionary VALUES ('FlowUserRole', 'auditor', null, '03', 'T', '审核人', 'U', '流程业务的审核人', null, null, '2');
INSERT INTO f_datadictionary VALUES ('FlowUserRole', 'operator', null, '02', 'T', '经办人', 'U', '流程业务的经办人', null, null, '1');
INSERT INTO f_datadictionary VALUES ('FlowUserRole', 'request', null, '01', 'T', '申请人', 'U', '流程业务的申请人', null, null, '0');
INSERT INTO f_datadictionary VALUES ('LogLevel', '0', null, null, 'T', '操作日志', 'F', null, null, null, '0');
INSERT INTO f_datadictionary VALUES ('LogLevel', '1', null, null, 'T', '错误提示', 'F', null, null, null, '1');
INSERT INTO f_datadictionary VALUES ('MsgType', 'A', null, null, 'T', '公告', 'F', '给部门群发的消息', null, null, '0');
INSERT INTO f_datadictionary VALUES ('MsgType', 'P', null, null, 'T', '个人消息', 'F', null, null, null, '1');
INSERT INTO f_datadictionary VALUES ('OptType', 'I', null, null, 'T', '项目业务', 'F', '项目业务', null, null, '2');
INSERT INTO f_datadictionary VALUES ('OptType', 'O', null, null, 'T', '普通业务', 'F', '普通业务', null, null, '0');
INSERT INTO f_datadictionary VALUES ('OptType', 'S', null, null, 'T', '实施业务', 'F', '实施业务', null, null, '1');
INSERT INTO f_datadictionary VALUES ('OptType', 'W', null, null, 'T', '工作流业务', 'F', '工作流业务', null, null, '3');
INSERT INTO f_datadictionary VALUES ('RankType', 'CM', '1', '', 'T', '董事长', 'S', '', null, null, '1');
INSERT INTO f_datadictionary VALUES ('RankType', 'DM', '5', '', 'T', '部门经理', 'S', '', null, null, '5');
INSERT INTO f_datadictionary VALUES ('RankType', 'GM', '2', '', 'T', '总经理', 'S', '', null, null, '2');
INSERT INTO f_datadictionary VALUES ('RankType', 'PM', '3', '', 'T', '副总经理', 'S', '', null, null, '3');
INSERT INTO f_datadictionary VALUES ('RankType', 'ST', '10', '', 'T', '员工', 'S', '', null, null, '10');
INSERT INTO f_datadictionary VALUES ('StationType', 'info', null, '', 'T', '信息维护', 'S', '', null, null, '2');
INSERT INTO f_datadictionary VALUES ('StationType', 'mang', null, '', 'T', '管理岗', 'S', '', null, null, '0');
INSERT INTO f_datadictionary VALUES ('StationType', 'serv', null, '', 'T', '后勤', 'S', '', null, null, '3');
INSERT INTO f_datadictionary VALUES ('StationType', 'tech', null, '', 'T', '技术岗', 'S', '', null, null, '1');
INSERT INTO f_datadictionary VALUES ('SUPPORT_LANG', 'en_US', null, null, 'T', 'English', 'S', null, null, null, '0');
INSERT INTO f_datadictionary VALUES ('SUPPORT_LANG', 'zh_CN', null, null, 'T', '中文', 'S', null, null, null, '1');
INSERT INTO f_datadictionary VALUES ('UnitType', 'A', null, null, 'T', '一般机构', 'U', '', null, null, '1');
INSERT INTO f_datadictionary VALUES ('UnitType', 'I', null, null, 'T', '项目组', 'U', '因为某个事务或者项目而建立的项目组', null, null, '2');
INSERT INTO f_datadictionary VALUES ('UnitType', 'O', null, null, 'T', '业务结构', 'U', '根据业务创建的组织', null, null, '3');
INSERT INTO f_datadictionary VALUES ('userSettingKey', 'LOCAL_LANG', null, null, 'T', '语言', 'S', '设置用户语言', null, null, null);
INSERT INTO f_datadictionary VALUES ('userSettingKey', 'receiveways', null, null, 'T', '消息接收方式', 'S', '用户接收消息的方式，可以是多个用逗号隔开', null, null, null);
INSERT INTO f_datadictionary VALUES ('YesOrNo', 'F', null, null, 'N', '否', 'F', '', null, null, '2');
INSERT INTO f_datadictionary VALUES ('YesOrNo', 'T', null, null, 'N', '是', 'F', '', null, null, '1');



INSERT INTO f_optdatascope VALUES ('117', 'USERMAG', '维护本部门用户', '[F_USERINFO.UNITCODE] = {currentStation.unitCode :currUnit}', '维护本部门数据库', 'G');
INSERT INTO f_optdatascope VALUES ('118', 'USERMAG', '所有用户', 'all', '维护全部用户', 'G');


-- 初始化业务菜单
INSERT INTO f_optinfo VALUES ('DATABASE', '集成数据库', 'DEPLOY', 'modules/sys/databaseinfo/databaseinfo.html', '/service/sys/databaseinfo', null, 'S', null, null, 'Y', null, null, null, null, 'D', '', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DEPLOY', '实施菜单', '0', '...', '...', null, 'S', null, null, 'Y', null, null, null, null, 'D', 'icon-ok', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DEPTMAG', '部门管理', '0', '13', '...', null, 'O', null, null, 'Y', null, null, null, null, 'I', 'icon-base icon-base-computer', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DEPTPOW', '下属部门管理', 'DEPTMAG', 'modules/sys/deptpow/deptpow.html', '/system/deptManager', null, 'O', null, null, 'Y', null, null, '0', null, 'D', 'icon-base icon-base-user', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DEPTROLE', '部门角色定义', 'DEPTMAG', 'modules/sys/deptrole/deptrole.html', '/system/roleinfo', null, 'O', null, null, 'Y', null, null, '0', null, 'D', 'icon-base icon-base-gear', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DEPTUSERINFO', '部门用户管理', 'DEPTMAG', 'modules/sys/deptuserinfo/deptuserinfo.html', '/system/unitinfo', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DICTSET', '数据字典管理', 'DEPLOY', 'modules/sys/dictionary/dictionary.admin.html', '/system/dictionary', null, 'S', null, null, 'Y', null, null, '0', null, 'D', 'icon-base icon-base-gear', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('DICTSET_M', '数据字典', 'SYS_CONFIG', 'modules/sys/dictionary/dictionary.html', '/system/dictionary', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('LOGINCAS', 'CAS登录入口', '0', '/system/mainframe/logincas', '/system/mainframe', null, 'O', null, null, 'N', null, null, null, null, 'D', '', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('OPTINFO', '系统业务', 'DEPLOY', 'modules/sys/optinfo/optinfo.html', '/system/optinfo', null, 'S', null, null, 'Y', null, null, '4', null, 'D', '', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('OPTLOG', '系统日志', 'DEPLOY', 'modules/sys/loginfo/loginfo.admin.html', '/system/optlog', null, 'S', null, null, 'Y', null, null, null, null, 'D', 'icon-ok', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('OPT_LOG_QUERY', '系统日志', 'SYS_CONFIG', 'modules/sys/loginfo/loginfo.html', '/system/optlog', null, 'O', null, null, 'Y', null, null, null, null, 'D', null, null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('ORGMAG', '组织管理', '0', '...', '...', null, 'O', null, null, 'Y', null, null, '3', null, 'I', 'icon-base icon-base-user', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('OS_INFO', '集成业务系统', 'DEPLOY', 'modules/sys/osinfo/osinfo.html', '/service/sys/os', null, 'S', null, null, 'Y', null, null, null, null, 'D', 'icon-base icon-base-gear', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('ROLEMAG', '角色定义', 'DEPLOY', 'modules/sys/roleinfo/roleinfo.html', '/system/roleinfo', null, 'S', null, null, 'Y', null, null, null, null, 'D', '', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('SYS_CONFIG', '系统维护', '0', '...', '...', null, 'O', null, null, 'Y', null, null, null, null, 'D', 'icon-base icon-base-gear', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('UNITINFO', '机构维护', 'SYS_CONFIG', 'modules/sys/unitinfo/unitinfo.html', '/system/unitinfo', null, 'O', null, null, 'Y', null, null, null, null, 'D', '', null, null, null, null, null, null);
INSERT INTO f_optinfo VALUES ('UNITMAG', '机构管理', 'ORGMAG', 'modules/sys/unitinfo/unitinfo.html', '/system/unitinfo', null, 'O', null, null, 'N', null, null, '2', null, 'D', '', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('USERINFO', '用户管理', 'SYS_CONFIG', 'modules/sys/userinfo/userinfo.html', '/system/userinfo', null, 'O', null, null, 'Y', null, null, null, null, 'D', '', null, null, null, null, null, null);
INSERT INTO f_optinfo VALUES ('USERMAG', '用户管理', 'ORGMAG', 'modules/sys/userinfo/userinfo.html', '/system/userinfo', null, 'O', null, null, 'N', null, null, null, null, 'D', '', null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('USERROLE', '用户角色', 'ORGMAG', '/modules/sys/userrole.html', '/system/userrole', null, 'O', null, null, 'N', null, null, null, null, 'D', null, null, null, null, null, 'u0000000', 'u0000000');
INSERT INTO f_optinfo VALUES ('USERUNIT', '用户机构', 'ORGMAG', '/modules/sys/userunit.html', '/system/userunit', null, 'O', null, null, 'N', null, null, null, null, 'D', null, null, null, null, null, 'u0000000', 'u0000000');




INSERT INTO f_optdef VALUES ('1', 'DEPLOY', '查看', 'list', '/*', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('10', 'SYS_CONFIG', '查看', 'list', '/*', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000001', 'UNITMAG', '编辑机构', 'update', '/*', '更新机构', null, 'F', null, null, 'U', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000002', 'UNITMAG', '删除机构', 'delete', '/*', '更新机构状态', null, 'F', null, null, 'D', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000007', 'DICTSET', '列举字典', 'list', '/', '查看字典初始页面', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000008', 'DICTSET', '新增字典目录', 'create', '/', '新建字典目录', null, 'F', null, null, 'C', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000009', 'DICTSET', '删除字典目录', 'delete', '/*', '删除字典目录', null, 'F', null, null, 'D', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000010', 'DICTSET', '修改字典目录', 'update', '/*', '编辑数据目录', null, 'F', null, null, 'U', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000020', 'OPTLOG', '查询列表', '', '/dummy', '查询系统日志入口', null, null, null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000029', 'USERUNIT', '新增用户机构关联', 'create', '/', '添加用户关联机构', null, null, null, null, 'C', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000030', 'USERUNIT', '编辑用户机构关联', 'update', '/*', '更新用户机构关联信息', null, null, null, null, 'U', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000031', 'USERUNIT', '删除用户机构关联', 'delete', '/*', '删除用户关联机构关联', null, null, null, null, 'D', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000032', 'USERROLE', '新增用户角色关联', null, '/', '添加用户关联角色', null, null, null, null, 'C', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000033', 'USERROLE', '编辑用户角色关联', null, '/*/*', '更新用户关联角色信息', null, null, null, null, 'U', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000034', 'USERROLE', '删除用户角色关联', null, '/*/*', '删除用户关联角色', null, null, null, null, 'D', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000041', 'OPT_LOG_QUERY', '查看日志详情', '', '/dummy', '查看日志入口', null, null, null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000042', 'DICTSET_M', '查询数据字典', 'list', '/', '查询数据字典列表', null, null, null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000043', 'DICTSET_M', '新增数据字典', 'create', '/', '新增数据目录', null, null, null, null, 'C', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000044', 'DICTSET_M', '编辑数据字典', 'update', '/*', '编辑数据字典', null, null, null, null, 'U', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000045', 'DICTSET_M', '删除数据字典', 'delete', '/*', '删除数据目录', null, null, null, null, 'D', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000059', 'UNITMAG', '查看所有机构', 'list', '/', '查看所有机构', null, null, null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000070', 'USERMAG', '用户列表', null, '/', '用户列表', null, null, null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000071', 'USERMAG', '创建用户', null, '/', '创建用户', null, null, null, null, 'C', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000072', 'USERMAG', '更新用户', null, '/*', '更新用户', null, null, null, null, 'U', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000073', 'USERMAG', '删除用户', null, '/*', '删除用户', null, null, null, null, 'D', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000080', 'LOGINCAS', 'CAS登录入口', null, '/logincas', null, null, null, null, null, 'RCU', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000101', 'OS_INFO', '所有权限', 'ALL', '/*', '更新机构状态', null, 'F', null, null, 'CRUD', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('1000102', 'DATABASE', '所有权限', 'ALL', '/*', null, null, null, null, null, 'CRUD', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('120', 'OPTLOG', '删除日志', 'delete', '/*', '删除日志', null, null, null, null, 'D', null, null);
INSERT INTO f_optdef VALUES ('124', 'OPTINFO', '新增', 'create', '/', '新建菜单（顶级和下级）', null, null, null, null, 'C', null, null);
INSERT INTO f_optdef VALUES ('125', 'OPTINFO', '删除', 'delete', '/*', '删除菜单', null, null, null, null, 'D', null, null);
INSERT INTO f_optdef VALUES ('126', 'OPTINFO', '编辑', 'update', '/*', '编辑菜单（包括操作权限）', null, null, null, null, 'U', null, null);
INSERT INTO f_optdef VALUES ('128', 'DICTSET', '编辑字典明细', 'updateDetail', '/update/*', '编辑字典明细', null, null, null, null, 'U', null, null);
INSERT INTO f_optdef VALUES ('130', 'DICTSET_M', '编辑字典明细', 'updateDetail', '/update/*', '编辑字典明细', null, null, null, null, 'U', null, null);
INSERT INTO f_optdef VALUES ('146', 'DEPTUSERINFO', '列表入口', 'list', '/dummy', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('150', 'UNITMAG', '新建机构', 'create', '/', '新建机构', null, null, null, null, 'C', null, null);
INSERT INTO f_optdef VALUES ('154', 'DEPTROLE', '查看', 'list', '/unit/*', '查看某个具体机构的角色', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('166', 'ROLEMAG', '修改', 'update', '/*', '修改角色包括权限', null, null, null, null, 'U', null, null);
INSERT INTO f_optdef VALUES ('167', 'ROLEMAG', '删除', 'delete', '/*', '删除角色', null, null, null, null, 'D', null, null);
INSERT INTO f_optdef VALUES ('168', 'ROLEMAG', '新建', 'create', '/', '创建角色', null, null, null, null, 'C', null, null);
INSERT INTO f_optdef VALUES ('169', 'USERINFO', '列表入口', '', '/dummy', '列表入口', null, null, null, null, 'R', null, null);
INSERT INTO f_optdef VALUES ('172', 'UNITINFO', '列表入口', '', '/dummy', '机构维护列表入口', null, null, null, null, 'R', null, null);
INSERT INTO f_optdef VALUES ('2', 'DEPTMAG', '查看', 'list', '/*', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('3', 'DEPTPOW', '查看', 'list', '/*', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('7', 'ORGMAG', '查看', 'list', '/*', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');
INSERT INTO f_optdef VALUES ('8', 'ROLEMAG', '查看', 'list', '/all', '查看', null, 'F', null, null, 'R', 'u0000000', 'u0000000');

-- 用户、角色、权限初始化


-- 初始化角色信息
insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('DEPLOY', '实施人员','G','T', '实施人员角色', sysdate, sysdate,'u0000000','u0000000');

insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('SYSADMIN', '系统管理员','G', 'T', '所有系统配置功能', sysdate, sysdate,'u0000000','u0000000');

insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('anonymous', '匿名角色','F', 'T', '匿名用户角色', sysdate, sysdate,'u0000000','u0000000');

insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('public', '公共角色','F', 'T', '公共角色权限会默认给不包括匿名用户的所有人', sysdate, sysdate,'u0000000','u0000000');


insert into F_ROLEINFO (ROLE_CODE, ROLE_NAME,ROLE_TYPE, IS_VALID, ROLE_DESC, CREATE_DATE, UPDATE_DATE,CREATOR,UPDATOR)
values ('forbidden', '禁用的功能','F', 'T', '这个角色不能赋给任何人，这个角色中的操作任何人都不可以调用。', to_date('12-12-2014 16:05:46', 'DD-MM-YYYY HH24:MI:SS'), sysdate,'u0000000','u0000000');

insert into F_ROLEPOWER (ROLE_CODE, OPT_CODE, UPDATE_DATE, CREATE_DATE, OPT_SCOPE_CODES,CREATOR,UPDATOR)
values ('public', '1000080', sysdate, sysdate, '','u0000000','u0000000');



insert into F_OPTDEF(opt_code,opt_id,opt_name,opt_method,opt_desc,
      is_in_workflow,UPDATE_DATE,create_date,opt_url,opt_req,CREATOR,UPDATOR)
select  S_OPTDEFCODE.NEXTVAL,opt_id , '查看', 'list',  '查看',
    'F',sysdate,sysdate,'/*','R' ,CREATOR,UPDATOR
    from F_OptInfo where opt_id not in (select opt_id from F_OPTDEF);

insert into F_ROLEPOWER(role_code,opt_code,update_Date,create_date,opt_scope_codes,CREATOR,UPDATOR)
  select 'SYSADMIN',opt_code,sysdate,sysdate,'',CREATOR,UPDATOR from F_OPTDEF;

insert into F_USERROLE (USER_CODE, ROLE_CODE, OBTAIN_DATE,
      SECEDE_DATE, CHANGE_DESC, UPDATE_DATE, CREATE_DATE,CREATOR,UPDATOR)
values ('u0000000', 'SYSADMIN', sysdate,
 null,'' ,sysdate, sysdate,'u0000000','u0000000');
 
update F_ROLEINFO
set ROLE_CODE = substr(ROLE_CODE, 3)
where ROLE_CODE like 'G-%';

update F_ROLEPOWER
set ROLE_CODE = substr(ROLE_CODE, 3)
where ROLE_CODE like 'G-%';

update F_USERROLE
set ROLE_CODE = substr(ROLE_CODE, 3)
where ROLE_CODE like 'G-%';

update F_ROLEINFO
set ROLE_TYPE = 'G';

update F_ROLEINFO
set ROLE_TYPE = 'F'
where ROLE_CODE = 'public' or ROLE_CODE = 'anonymous' or ROLE_CODE = 'forbidden';

 
  commit;
