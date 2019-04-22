--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      n
-- Project :      国际处理模型.DM1
-- Author :       jj
--
-- Date Created : Tuesday, April 09, 2019 09:34:26
-- Target DBMS : MySQL 5.x
--
DROP TABLE IF EXISTS int_comm_biz_resp;
CREATE TABLE int_comm_biz_resp(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    guid                VARCHAR(36)   comment   '36位系统唯一序号',
    mail_no             VARCHAR(30)   comment   '邮件号',
    biz_type            CHAR(1)       comment   '业务类型 （与申请报文类型对应） 1 出库确认 2 入库确认 3总包转关单回执 4 封发回执 5 邮件申请',
    biz_no              VARCHAR(96)   comment   '企业业务单证号 （与申请报文类型对应）邮件号/邮件号/总包路单号/总包号/邮件号',
    customs_biz_no      VARCHAR(96)   comment   '海关审批单证号 （与申请报文类型对应）空/空/总包转关单审核号/总包审核号',
    return_status       VARCHAR(8)    comment   '回执状态',
    return_time         VARCHAR(17)   comment   '回执时间 格式yyyymmddhhmmsssss',
    return_info         VARCHAR(1500) comment   '回执信息 如退单原因',
    ins_date            DATETIME(6)   comment    '入库时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)         DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_comm_biz_resp(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_comm_msg_resp;
CREATE TABLE int_comm_msg_resp(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    message_id          VARCHAR(128)           comment  '报文唯一编号',
    guid                VARCHAR(36)            comment '36位系统唯一序号',
    return_status       VARCHAR(8)             comment  '回执代码',
    return_time         CHAR(17)               comment  '回执时间 格式yyyymmddhhmmsssss',
    return_info         VARCHAR(1500)          comment '回执信息 如:消息无法解析',
    recv_file_length    INT                    comment '接收报文大小 单位：字节',
    recv_time           VARCHAR(17)            comment '接收报文时间 格式yyyymmddhhmmsssss',
    ins_date            DATETIME(6)            comment  '入库时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)         DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_comm_msg_resp(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_in_confirm_info;
CREATE TABLE int_in_confirm_info(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    guid                VARCHAR(36)    comment '36位系统唯一序号',
    sys_id              VARCHAR(20)    comment                '业务系统标识',
    mail_no             VARCHAR(64)    comment                '邮件号',
    d_port              VARCHAR(6)     comment                '申报海关代码',
    pack_num            VARCHAR(4)     comment                '入库件数',
    store_name          VARCHAR(383)   comment                '库房名称',
    return_time         CHAR(17)       comment                '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)     comment                '回执状态',
    return_info         VARCHAR(1500)  comment                '回执信息 如退单原因',
    ins_date            DATETIME(6)    comment                '入库时间',
    file_message_id     VARCHAR(50)    comment                '报文id',
    file_guid           VARCHAR(36)    comment                '报文的36位系统唯一序号',
    upd_date            DATETIME(6)    comment                '报文更新时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)      NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
	curr_stat           CHAR(1),
	curr_stat_desc_txt  VARCHAR(255),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_in_confirm_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_item_apply_info;
CREATE TABLE int_item_apply_info(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    guid                VARCHAR(36)    comment '36位系统唯一序号',
    sys_id              VARCHAR(20)    comment '业务系统标识',
    app_type            CHAR(1)        comment '申报类型 1-新增;2-变更;3-删除，默认为1',
    mail_no             VARCHAR(64)    comment '邮件号',
    d_port              VARCHAR(6)     comment '申报海关代码',
    decl_source         VARCHAR(4)     comment '信息来源 1:个人申报/2:企业申报',
    decl_name           VARCHAR(48)    comment '申报人姓名 个人申报必填',
    decl_id_type        VARCHAR(255)    comment '申报人证件类型 个人申报必填1 身份证 2 护照 3 其他',
    decl_id             VARCHAR(255)    comment '申报人证件号 个人申报必填',
    decl_tel            VARCHAR(255)    comment '申报人电话 个人申报必填',
    agent_code          VARCHAR(100)    comment '申报企业代码',
    agent_name          VARCHAR(383)    comment '申报企业名称',
    decl_type           VARCHAR(4)     comment '申请类型代码 个人申请只能是退运。参见代码表。',
    note                VARCHAR(383)    comment '备注',
    ref_bill_type       VARCHAR(4)     comment  '随附单证类型 企业申报必填1:h2010报关单/2:公自用物品审核单/3:其它',
    ref_bill_no         VARCHAR(150)    comment '随附单证号 企业申报必填',
    return_time         VARCHAR(17)    comment '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)     comment '回执状态',
    return_info         VARCHAR(1500)    comment '回执信息 如退单原因',
    ins_date            DATETIME(6)    comment '入库时间',
    file_message_id     VARCHAR(50)    comment  '报文id',
    file_guid           VARCHAR(36)    comment '报文的36位系统唯一序号',
    upd_date            DATETIME(6)    comment  '报文更新时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         TIMESTAMP(6)         DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
	curr_stat           CHAR(1),
	curr_stat_desc_txt  VARCHAR(255),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_item_apply_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_item_attach_info;
CREATE TABLE int_item_attach_info(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    guid                VARCHAR(36)   comment  '36位系统唯一序号',
    sys_id              VARCHAR(20)   comment  '业务系统标识',
    mail_no             VARCHAR(64)   comment  '邮件号',
    d_port              VARCHAR(6)    comment  '申报海关代码',
    f_type              CHAR(1)       comment '附件类型 1:jpg;2:png;3:pdf',
    f_content_url       VARCHAR(1000) comment '附件内容 附件的16进制字符串',
    f_length            VARCHAR(20)   comment  '附件长度',
    return_time         VARCHAR(17)   comment '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)    comment '回执状态',
    return_info         VARCHAR(1500) comment '回执信息 如退单原因',
    ins_date            DATETIME(6)   comment '入库时间',
    file_message_id     VARCHAR(50)   comment '报文id',
    file_guid           VARCHAR(36)   comment '报文的36位系统唯一序号',
    upd_date            DATETIME(6)   comment '报文更新时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)         DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
	curr_stat           CHAR(1),
	curr_stat_desc_txt  VARCHAR(255),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_item_attach_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_item_basic_info;
CREATE TABLE int_item_basic_info(
    id                   BIGINT            AUTO_INCREMENT,
    org_drds_code        VARCHAR(20)       NOT NULL,
    tab_part_code        DATETIME(6)          NOT NULL,
    guid                 VARCHAR(36)       comment '36位系统唯一序号',
    sys_id               VARCHAR(20)       comment '业务系统标识',
    app_type             CHAR(1)           comment  '申报类型 1-新增;2-变更;3-删除;默认1',
    mail_no              VARCHAR(64)       comment '邮件号 唯一',
    decl_source          CHAR(1)           comment '申报信息来源 1:个人申报/2:企业申报',
    d_port               VARCHAR(6)        comment '邮件申报海关',
    agent_code           VARCHAR(18)       comment '邮政企业代码',
    agent_name           VARCHAR(383)    comment '邮政企业名称',
    ie_flag              CHAR(1)           comment '进出境标志 i 进口/e 出口',
    country              CHAR(3)           comment '国别',
    ie_date              CHAR(14)          comment '进出境日期 进境：进境日期；出境：收寄日期；格式：yyyymmddhhmmss',
    d_type               VARCHAR(3)        comment '申报类别 类别代码1：物品/2：货物',
    mail_type            CHAR(1)           comment '邮件种类 p 普邮/e 速递',
    send_office          VARCHAR(150)    comment '原寄局 进境选填；出境必填用中文；',
    recv_office          VARCHAR(150)    comment  '寄达局',
    send_name            VARCHAR(150)    comment '寄件人姓名',
    send_address         VARCHAR(383)     comment '寄件人地址 进境至少申报到“城市”级别；出境至少到“街道”级别；',
    send_tel             VARCHAR(45)       comment '寄件人电话、传真 如邮件详情单无该信息可不填（出口必填）',
    send_company         VARCHAR(383)      comment '寄件人企业名称 称如邮件详情单无该信息可不填',
    send_id_type         CHAR(1)           comment '寄件人证类型 1 身份证 2 护照 3 其他',
    send_id              VARCHAR(64)       comment '寄件人证件号码 出口必填',
    recv_name            VARCHAR(150)     comment '收件人姓名 进境必填',
    recv_address         VARCHAR(383)     comment '收件人地址 进境至少申报到“街道”级别；出境至少申报到“城市”级别；',
    recv_tel             VARCHAR(45)       comment '收件人电话、传真 如邮件详情单无该信息可不填 （个人申报必填）',
    recv_company         VARCHAR(383)     comment '收件人企业名称 如邮件详情单无该信息可不填',
    recv_id_type         CHAR(1)           comment '收件人证件类型 1 身份证 2 护照 3 其他（个人申报必填）',
    recv_id              VARCHAR(64)       comment '收件人证件号码 个人申报必填',
    total_wt             DECIMAL(12, 3)  comment '邮件总重量 单位：kg',
    curr_code            CHAR(3)           comment '申报币制',
    postage_curr_code    CHAR(3)           comment '邮资币制',
    postage              DECIMAL(11, 2)   comment '邮资按邮资币制的价值',
    pack_num             INT               comment '件数 针对一票单件/多件',
    main_gname           VARCHAR(383)      comment '主要物品名称 只接受中、英文',
    note                 VARCHAR(383)      comment '备注',
    spec_mail_tag        CHAR(1)           comment  '特殊邮件标志 n 普通/f 外交/l 分运行李/e 电子商务/s 单一不可分割物品',
    data_source          CHAR(1)           comment  '数据来源 1收寄报文2信息补录3收寄信息补录更新4信息补录更新',
    return_time          CHAR(17)          comment '回执时间 格式yyyymmddhhmmsssss',
    return_status        VARCHAR(8)        comment '回执状态',
    return_info          VARCHAR(1500)    comment '回执信息 如退单原因',
    ins_date             DATETIME(6)       comment '入库时间',
    file_message_id      VARCHAR(50)       comment '报文id',
    file_guid            VARCHAR(36)       comment '报文的36位系统唯一序号',
    upd_date             DATETIME(6)       comment '报文更新时间',
    create_user_code     VARCHAR(20)       NOT NULL,
    create_user_name     VARCHAR(30),
    gmt_created          DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code     VARCHAR(20),
    modify_user_name     VARCHAR(30),
    gmt_modified         DATETIME(6),
	curr_stat            CHAR(1),
	curr_stat_desc_txt   VARCHAR(255),
    is_deleted           CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1            BIGINT,
    reserved2            BIGINT,
    reserved3            BIGINT,
    reserved4            VARCHAR(200),
    reserved5            VARCHAR(200),
    reserved6            VARCHAR(200),
    reserved7            VARCHAR(200),
    reserved8            VARCHAR(200),
    reserved9            DATETIME(6),
    reserved11           VARCHAR(200),
    UNIQUE INDEX pk_int_item_basic_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_item_basic_resp;
CREATE TABLE int_item_basic_resp(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    guid                VARCHAR(36)      comment '36位系统唯一序号',
    mail_no             VARCHAR(30)      comment  '邮件号',
    customs_code        VARCHAR(30)      comment  '关区代码',
    return_time         VARCHAR(17)      comment '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)       comment  '回执状态',
    return_info         VARCHAR(1500)    comment '回执信息 如退单原因',
    agent_code          VARCHAR(18)      comment  '申报单位代码 10位海关代码或者18位信用代码(兼容考虑，暂设为选填)',
    duty_flag           VARCHAR(4)       comment '征税标志 1-有税；0-无税',
    ins_date            DATETIME(6)      comment '入库时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)         DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_item_basic_resp(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_item_inner_info;
CREATE TABLE int_item_inner_info(
    id                        BIGINT            AUTO_INCREMENT,
    int_item_basic_info_id    BIGINT            NOT NULL,
    org_drds_code             VARCHAR(20)       NOT NULL,
    tab_part_code             DATETIME(6)          NOT NULL,
    guid                      VARCHAR(36)            comment   '36位系统唯一序号',
    seq_no                    INT                    comment  '序号 从1开始连续序号',
    g_no                      VARCHAR(383)           comment '物品名称中英文 应税类填写中文',
    g_no_zh                   VARCHAR(383)           comment '物品名称中文',
    g_no_en                   VARCHAR(383)           comment  '物品名称英文',
    code_ts                   VARCHAR(10)            comment  '归类编码 该编码为行邮物品归类编码；',
    ori_country               VARCHAR(3)             comment '原产地(国别、地区)',
    qty                       DECIMAL(19, 5)         comment  '物品数量',
    unit                      VARCHAR(3)             comment '计量单位',
    value                     DECIMAL(11, 2)         comment  '申报总价',
    g_model                   VARCHAR(3000)          comment  '规格型号 个人申报方式建议填写',
    ins_date                  DATETIME(6)            comment '入库时间',
    create_user_code          VARCHAR(20)       NOT NULL,
    create_user_name          VARCHAR(30),
    gmt_created               DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code          VARCHAR(20),
    modify_user_name          VARCHAR(30),
    gmt_modified              DATETIME(6),
    is_deleted                CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1                 BIGINT,
    reserved2                 BIGINT,
    reserved3                 BIGINT,
    reserved4                 VARCHAR(200),
    reserved5                 VARCHAR(200),
    reserved6                 VARCHAR(200),
    reserved7                 VARCHAR(200),
    reserved8                 VARCHAR(200),
    reserved9                 DATETIME(6),
    reserved11                VARCHAR(200),
    UNIQUE INDEX pk_int_item_inner_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_item_recv_info;
CREATE TABLE int_item_recv_info(
    id                     BIGINT            AUTO_INCREMENT,
    org_drds_code          VARCHAR(20)       NOT NULL,
    tab_part_code          DATETIME(6)          NOT NULL,
    guid                   VARCHAR(36)       comment   '36位系统唯一序号',
    sys_id                 VARCHAR(20)       comment   '业务系统标识',
    pack_no                VARCHAR(64)      comment   '总包号',
    mail_no                VARCHAR(64)    comment   '邮件号',
    i_e_flag               CHAR(1)        comment   '进出境标志代码 i 进口/e 出口',
    recv_date              VARCHAR(14)    comment   '开拆日期 格式yyyymmddhhmmss',
    recv_port              VARCHAR(6)     comment   '开拆局海关代码(邮办）',
    recv_office            VARCHAR(150)   comment   '开拆局',
    send_port              VARCHAR(6)     comment   '原寄局海关代码 原寄局为“空”，表示该邮件是第一次开拆的进境邮件。',
    send_office            VARCHAR(150)   comment   '原寄局',
    tran_code              VARCHAR(383)   comment   '邮递方式（文字）',
    weight                 DECIMAL(19, 3) comment   '重量',
    spec_tag               VARCHAR(383)   comment   '特殊处理标志',
    customs_transit_tag    VARCHAR(4)     comment   '本地/转关标志 1:本地(放行); 2:转关',
    return_time            CHAR(17)       comment   '回执时间 格式yyyymmddhhmmsssss',
    return_status          VARCHAR(8)     comment   '回执状态',
    return_info            VARCHAR(1500)  comment   '回执信息 如退单原因',
    ins_date               DATETIME(6)    comment   '入库时间',
    file_message_id        VARCHAR(50)    comment   '报文id',
    file_guid              VARCHAR(36)    comment   '报文的36位系统唯一序号',
    upd_date               DATETIME(6)    comment   '报文更新时间',
    create_user_code       VARCHAR(20)       NOT NULL,
    create_user_name       VARCHAR(30),
    gmt_created            DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code       VARCHAR(20),
    modify_user_name       VARCHAR(30),
    gmt_modified           DATETIME(6),
	curr_stat              CHAR(1),
	curr_stat_desc_txt     VARCHAR(255),
    is_deleted             CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1              BIGINT,
    reserved2              BIGINT,
    reserved3              BIGINT,
    reserved4              VARCHAR(200),
    reserved5              VARCHAR(200),
    reserved6              VARCHAR(200),
    reserved7              VARCHAR(200),
    reserved8              VARCHAR(200),
    reserved9              DATETIME(6),
    reserved11             VARCHAR(200),
    UNIQUE INDEX pk_int_item_recv_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_out_confirm_info;
CREATE TABLE int_out_confirm_info(
    id                  BIGINT           AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)      NOT NULL,
    tab_part_code       DATETIME(6)         NOT NULL,
    guid                VARCHAR(36)     comment '36位系统唯一序号',
    sys_id              VARCHAR(20)     comment '业务系统标识',
    mail_no             VARCHAR(64)     comment '邮件号',
    d_port              VARCHAR(6)      comment '申报海关代码',
    o_store_no          VARCHAR(64)     comment '出库流水号',
    return_time         VARCHAR(17)     comment '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)      comment '回执状态',
    return_info         VARCHAR(1500)   comment '回执信息 如退单原因',
    ins_date            DATETIME(6)     comment '入库时间',
    file_message_id     VARCHAR(50)     comment '报文id',
    file_guid           VARCHAR(36)     comment '报文的36位系统唯一序号',
    upd_date            DATETIME(6)     comment '报文更新时间',
    create_user_code    VARCHAR(20)      NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)         DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
	curr_stat           CHAR(1),
	curr_stat_desc_txt  VARCHAR(255),
    is_deleted          CHAR(1)          DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_out_confirm_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_pack_send_info;
CREATE TABLE int_pack_send_info(
    id                  BIGINT            AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)       NOT NULL,
    tab_part_code       DATETIME(6)          NOT NULL,
    guid                VARCHAR(36)    comment '36位系统唯一序号',
    sys_id              VARCHAR(20)    comment '业务系统标识',
    app_type            CHAR(1)        comment '申报类型 1-新增;2-变更;3-删除，默认为1',
    pack_serial         VARCHAR(32)    comment '总包序列号 总包唯一标识',
    pack_no             VARCHAR(64)    comment '总包号',
    delivery_no         VARCHAR(64)    comment  '总包路单号',
    pack_type           CHAR(1)        comment '总包类型 1:水陆路/2:航空/3:空运水陆路',
    route               VARCHAR(150)   comment '路由',
    i_e_flag            CHAR(1)        comment '进出境标志代码 i 进口/e 出口',
    send_date           VARCHAR(14)    comment '封发日期 格式yyyymmddhhmmss',
    d_port              VARCHAR(6)     comment '主管海关',
    agent_code          VARCHAR(20)    comment '邮政企业代码',
    traf_mode           VARCHAR(4)     comment '运输方式代码',
    total_wt            DECIMAL(19, 3)  comment '总重量 单位：kg',
    send_info_count     INT            comment '总邮袋数',
    send_info_num       INT            comment '总件数',
    spec_tag            VARCHAR(383)   comment '特殊标志',
    return_time         VARCHAR(17)    comment '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)     comment '回执状态',
    return_info         VARCHAR(1500)  comment '回执信息 如退单原因',
    ins_date            DATETIME(6)    comment '入库时间',
    file_message_id     VARCHAR(50)    comment '报文id',
    file_guid           VARCHAR(36)    comment '报文的36位系统唯一序号',
    upd_date            DATETIME(6)    comment '报文更新时间',
    create_user_code    VARCHAR(20)       NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
	curr_stat           CHAR(1),
	curr_stat_desc_txt  VARCHAR(255),
    is_deleted          CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_pack_send_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_pack_send_list;
CREATE TABLE int_pack_send_list(
    id                       BIGINT            AUTO_INCREMENT,
    int_pack_send_info_id    BIGINT            NOT NULL,
    org_drds_code            VARCHAR(20)       NOT NULL,
    tab_part_code            DATETIME(6)          NOT NULL,
    guid                     VARCHAR(36)   comment '36位系统唯一序号',
    seq_no                   INT           comment '序号 从1开始连续序号',
    mail_no                  VARCHAR(64)   comment '邮件号',
    mail_wt                  DECIMAL(19, 3)   comment '邮件重量',
    operate_type             VARCHAR(4)    comment '操作类型 1新增/2删除 默认新增',
    ins_date                 DATETIME(6)   comment '入库时间',
    create_user_code         VARCHAR(20)       NOT NULL,
    create_user_name         VARCHAR(30),
    gmt_created              DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code         VARCHAR(20),
    modify_user_name         VARCHAR(30),
    gmt_modified             DATETIME(6),
    is_deleted               CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1                BIGINT,
    reserved2                BIGINT,
    reserved3                BIGINT,
    reserved4                VARCHAR(200),
    reserved5                VARCHAR(200),
    reserved6                VARCHAR(200),
    reserved7                VARCHAR(200),
    reserved8                VARCHAR(200),
    reserved9                DATETIME(6),
    reserved11               VARCHAR(200),
    UNIQUE INDEX pk_int_pack_send_list(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_parcel_trans_info;
CREATE TABLE int_parcel_trans_info(
    id                  BIGINT            AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)       NOT NULL,
    tab_part_code       DATETIME(6)          NOT NULL,
    guid                VARCHAR(36)    comment '36位系统唯一序号',
    sys_id              VARCHAR(20)    comment '业务系统标识',
    app_type            CHAR(1)        comment '申报类型 1-新增;2-变更;3-删除，默认为1',
    delivery_serial     VARCHAR(32)    comment '路单序列号 路单唯一标识',
    delivery_no         VARCHAR(64)    comment '总包路单号',
    pack_type           CHAR(1)        comment '总包类型 1:水陆路,2:航空, 3:空运水陆路',
    route               VARCHAR(150)   comment '路由',
    ie_flag             CHAR(1)        comment '进出境标志代码 i 进口/e 出口',
    agent_code          VARCHAR(20)    comment '邮政企业代码',
    send_office         VARCHAR(150)   comment '原寄局',
    recv_office         VARCHAR(150)   comment '寄达局',
    send_date           VARCHAR(14)    comment '启运日期 格式yyyymmddhhmmss',
    send_port           VARCHAR(6)     comment '启运地海关',
    recv_port           VARCHAR(6)     comment '指运地海关',
    total_wt            DECIMAL(19, 3)  comment '总重量',
    pack_count          INT            comment '总邮袋数',
    pack_num            INT            comment '总件数',
    spec_tag            VARCHAR(383)   comment '特殊标志',
    return_time         VARCHAR(17)    comment '回执时间 格式yyyymmddhhmmsssss',
    return_status       VARCHAR(8)     comment '回执状态',
    return_info         VARCHAR(1500)  comment '回执信息 如退单原因',
    ins_date            DATETIME(6)    comment '入库时间',
    file_message_id     VARCHAR(50)    comment '报文id',
    file_guid           VARCHAR(36)    comment '报文的36位系统唯一序号',
    upd_date            DATETIME(6)    comment '报文更新时间',
    create_user_code    VARCHAR(20)       NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
	curr_stat           CHAR(1),
	curr_stat_desc_txt  VARCHAR(255),
    is_deleted          CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_parcel_trans_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_parcel_trans_list;
CREATE TABLE int_parcel_trans_list(
    id                          BIGINT            AUTO_INCREMENT,
    int_parcel_trans_info_id    BIGINT            NOT NULL,
    org_drds_code               VARCHAR(20)       NOT NULL,
    tab_part_code               DATETIME(6)          NOT NULL,
    guid                        VARCHAR(36)    comment '36位系统唯一序号',
    seq_no                      INT            comment '序号 从1开始连续序号',
    pack_no                     VARCHAR(64)    comment  '总包号',
    pack_wt                     DECIMAL(19, 3) comment '总重量',
    pack_count                  INT            comment '总邮袋数',
    customs_biz_no              VARCHAR(96)    comment '海关审批单证号',
    ins_date                    DATETIME(6)    comment '入库时间',
    create_user_code            VARCHAR(20)       NOT NULL,
    create_user_name            VARCHAR(30),
    gmt_created                 DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code            VARCHAR(20),
    modify_user_name            VARCHAR(30),
    gmt_modified                DATETIME(6),
    is_deleted                  CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1                   BIGINT,
    reserved2                   BIGINT,
    reserved3                   BIGINT,
    reserved4                   VARCHAR(200),
    reserved5                   VARCHAR(200),
    reserved6                   VARCHAR(200),
    reserved7                   VARCHAR(200),
    reserved8                   VARCHAR(200),
    reserved9                   DATETIME(6),
    reserved11                  VARCHAR(200),
    UNIQUE INDEX pk_int_parcel_trans_list(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_tax_info;
CREATE TABLE int_tax_info(
    id                  BIGINT            AUTO_INCREMENT,
    org_drds_code       VARCHAR(20)       NOT NULL,
    tab_part_code       DATETIME(6)          NOT NULL,
    guid                VARCHAR(36)      comment '36位系统唯一序号',
    return_time         VARCHAR(17)      comment '回执时间 格式:yyyymmddhhmmsssss',
    tax_no              VARCHAR(96)      comment '邮件税单号',
    mail_no             VARCHAR(64)      comment '邮件号',
    tax_ent_no          VARCHAR(96)      comment '汇总税单号',
    payer_name          VARCHAR(150)     comment '缴款人姓名',
    payer_address       VARCHAR(383)     comment '缴款人地址',
    tax_total_value     DECIMAL(11, 2)  comment '行邮税总额',
    return_status       CHAR(1)         comment '税单状态 0:已生成; 1: 已汇总',
    agent_code          VARCHAR(18)     comment '申报单位代码 10位海关代码或者18位信用代码(兼容考虑，暂设为选填)',
    ins_date            DATETIME(6)     comment '入库时间',
    create_user_code    VARCHAR(20)       NOT NULL,
    create_user_name    VARCHAR(30),
    gmt_created         DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
    is_deleted          CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_tax_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_tax_list;
CREATE TABLE int_tax_list(
    id                  BIGINT            AUTO_INCREMENT,
    int_tax_list_id     BIGINT            NOT NULL,
    org_drds_code       VARCHAR(20)       NOT NULL,
    tab_part_code       DATETIME(6)          NOT NULL,
    guid                VARCHAR(36)     comment '36位系统唯一序号',
    g_no                INT             comment '商品序号 从1开始连续序号',
    g_name              VARCHAR(383)    comment '物品名称',
    code_ts             VARCHAR(10)     comment '归类编码',
    total_value         DECIMAL(11, 2)           comment  '完税价格',
    post_tax_rate       DECIMAL(6, 2)            comment '行邮税税率',
    post_tax_value      DECIMAL(11, 2)           comment '行邮税金额',
    ins_date            DATETIME(6)     comment  '入库时间',
    create_user_code    VARCHAR(20)       NOT NULL,          
    create_user_name    VARCHAR(30),                         
    gmt_created         DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code    VARCHAR(20),
    modify_user_name    VARCHAR(30),
    gmt_modified        DATETIME(6),
    is_deleted          CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1           BIGINT,
    reserved2           BIGINT,
    reserved3           BIGINT,
    reserved4           VARCHAR(200),
    reserved5           VARCHAR(200),
    reserved6           VARCHAR(200),
    reserved7           VARCHAR(200),
    reserved8           VARCHAR(200),
    reserved9           DATETIME(6),
    reserved11          VARCHAR(200),
    UNIQUE INDEX pk_int_tax_list(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_taxent_info;
CREATE TABLE int_taxent_info(
    id                    BIGINT          AUTO_INCREMENT,
    org_drds_code         VARCHAR(20)     NOT NULL,
    tab_part_code         DATETIME(6)        NOT NULL,
    guid                  VARCHAR(36)     comment '36位系统唯一序号',
    return_time           VARCHAR(17)     comment  '回执时间 格式:yyyymmddhhmmsssss',
    tax_ent_no            VARCHAR(20)     comment  '汇总税单号',
    d_port                VARCHAR(6)      comment  '申报口岸代码',
    payer_company_code    VARCHAR(100)    comment  '缴款单位编码代码',
    payer_company         VARCHAR(150)    comment  '缴款单位名称',
    ins_date              DATETIME(6)     comment  '入库时间',
    create_user_code      VARCHAR(20)     NOT NULL,
    create_user_name      VARCHAR(30),
    gmt_created           DATETIME(6)        DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code      VARCHAR(20),
    modify_user_name      VARCHAR(30),
    gmt_modified          DATETIME(6),
    is_deleted            CHAR(1)         DEFAULT '0' NOT NULL,
    reserved1             BIGINT,
    reserved2             BIGINT,
    reserved3             BIGINT,
    reserved4             VARCHAR(200),
    reserved5             VARCHAR(200),
    reserved6             VARCHAR(200),
    reserved7             VARCHAR(200),
    reserved8             VARCHAR(200),
    reserved9             DATETIME(6),
    reserved11            VARCHAR(200),
    UNIQUE INDEX pk_int_taxent_info(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;


DROP TABLE IF EXISTS int_taxent_list;
CREATE TABLE int_taxent_list(
    id                    BIGINT            AUTO_INCREMENT,
    int_taxent_info_id    BIGINT            NOT NULL,
    org_drds_code         VARCHAR(20)       NOT NULL,
    tab_part_code         DATETIME(6)          NOT NULL,
    guid                  VARCHAR(36)       comment  '36位系统唯一序号',
    item_no               INT               comment  '税单序号 从1开始连续序号',
    tax_type              VARCHAR(4)        comment '税种代码',
    duty_value            DECIMAL(11, 2)    comment '税款金额',
    print_date            VARCHAR(14)       comment '打印日期 格式yyyymmddhhmmss',
    p_limit               VARCHAR(14)       comment '缴款期限 格式yyyymmddhhmmss',
    status                CHAR(1)           comment '汇总税单状态 0-已生成 1-已作废 2-已核注 3-已核销',
    c_date                VARCHAR(14)       comment '交款日期 格式yyyymmddhhmmss',
    delay_day             INT               comment '滞纳天数',
    ins_date              DATETIME(6)       comment '入库时间',
    create_user_code      VARCHAR(20)       NOT NULL,
    create_user_name      VARCHAR(30),
    gmt_created           DATETIME(6)          DEFAULT current_timestamp(6) NOT NULL,
    modify_user_code      VARCHAR(20),
    modify_user_name      VARCHAR(30),
    gmt_modified          DATETIME(6),
    is_deleted            CHAR(1)           DEFAULT '0' NOT NULL,
    reserved1             BIGINT,
    reserved2             BIGINT,
    reserved3             BIGINT,
    reserved4             VARCHAR(200),
    reserved5             VARCHAR(200),
    reserved6             VARCHAR(200),
    reserved7             VARCHAR(200),
    reserved8             VARCHAR(200),
    reserved9             DATETIME(6),
    reserved11            VARCHAR(200),
    UNIQUE INDEX pk_int_taxent_list(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 dbpartition by hash('org_drds_code') tbpartition by MM('tab_part_code') tbpartitions 12
;



ALTER TABLE int_comm_biz_resp ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_comm_msg_resp ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_in_confirm_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_item_apply_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_item_attach_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_item_basic_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_item_basic_resp ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_item_inner_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_item_recv_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_out_confirm_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_pack_send_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_pack_send_list ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_parcel_trans_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_parcel_trans_list ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_tax_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_tax_list ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_taxent_info ADD 
    PRIMARY KEY (id)
;

ALTER TABLE int_taxent_list ADD 
    PRIMARY KEY (id)
;
