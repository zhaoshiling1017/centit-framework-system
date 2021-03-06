package com.centit.framework.system.po;

import com.alibaba.fastjson.annotation.JSONField;
import com.centit.framework.core.dao.DictionaryMap;
import com.centit.framework.model.basedata.IUserInfo;
import com.centit.support.database.orm.GeneratorCondition;
import com.centit.support.database.orm.GeneratorTime;
import com.centit.support.database.orm.GeneratorType;
import com.centit.support.database.orm.ValueGenerator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * FUserinfo entity.
 *
 * @author MyEclipse Persistence Tools
 */
// 系统用户信息表
@Entity
@Table(name = "F_USERINFO")
@ApiModel(value="系统用户信息对象",description="系统用户信息对象 UserInfo")
public class UserInfo implements IUserInfo, java.io.Serializable{
    // Fields
    private static final long serialVersionUID = -1753127177790732963L;

    @Id
    @Column(name = "USER_CODE")
    @ValueGenerator(strategy = GeneratorType.RANDOM_ID, value = "7:U")
    @ApiModelProperty(value = "用户代码",name = "userCode")
    private String userCode; // 用户代码

    //密码不参与返回序列化
    @JSONField(serialize = false)
    @Column(name = "USER_PIN")
    @Length(max = 100, message = "字段长度不能大于{max}")
    @ApiModelProperty(value = "用户密码",name = "userPin")
    private String userPin; // 用户密码

    @Column(name = "IS_VALID")
    @NotBlank(message = "字段不能为空")
    @Pattern(regexp = "[TFA]", message = "字段值必须是T或F,A为新建可以删除")
    @ApiModelProperty(value = "是否生效 T:生效 F:失效 A:新建可以删除",name = "isValid",required = true)
    private String isValid; // 状态

    /**
     * 'G发布任务/R接收任务/S系统管理';
     */
    @Column(name = "USER_TYPE")
    @Length(max = 1, message = "字段长度不能大于{max}")
    @ApiModelProperty(value = "G发布任务/R接收任务/S系统管理",name = "userType")
    private String userType; // 用户类别

    @Column(name = "LOGIN_NAME")
    @NotBlank(message = "字段不能为空")
    @Length(max = 100, message = "字段长度不能大于{max}")
    @ApiModelProperty(value = "用户登录名 字段不能为空",name = "loginName",required = true)
    private String loginName; // 用户登录名

    @Column(name = "USER_NAME")
    @NotBlank(message = "字段不能为空")
    @Length(max = 300, message = "字段长度不能大于{max}")
    @ApiModelProperty(value = "用户姓名 字段不能为空",name = "userName",required = true)
    private String userName; // 用户姓名

    @Column(name = "ENGLISH_NAME")
    @Length(max = 300, message = "字段长度不能大于{max}")
    @ApiModelProperty(value = "用户英文姓名",name = "englishName")
    private String englishName;// 用户英文姓名

    @Column(name = "USER_DESC")
    @Length(max = 256, message = "字段长度不能大于{max}")
    private String userDesc; // 用户描述

    @Column(name = "LOGIN_TIMES")
    private Long loginTimes; // 登录次数

    @Column(name = "ACTIVE_TIME")
    @Temporal(TemporalType.DATE)
    private Date activeTime; // 最后一次登录时间

    @Column(name = "PWD_EXPIRED_TIME")
    @Temporal(TemporalType.DATE)
    private Date pwdExpiredTime; // 密码失效时间

    @Column(name = "REG_EMAIL")
    @Email(message = "Email格式不正确")
    @Length(max = 60, message = "字段长度不能大于{max}")
    private String regEmail; // 注册email

    @Column(name = "USER_PWD")
    @Length(max = 20, message = "字段长度不能大于{max}")
    @JSONField(serialize = false)
    private String userPwd;

    @Column(name = "REG_CELL_PHONE")
    @Length(max = 15, message = "字段长度不能大于{max}")
    private String regCellPhone;

    @Column(name="ID_CARD_NO")
    @Length(max=20,message="大于{max}")
    private String idCardNo;

    @Column(name = "USER_WORD")
    @Length(max = 100, message = "字段长度不能大于{max}")
    private String userWord;

    @Column(name = "USER_TAG")
    @Length(max = 100, message = "字段长度不能大于{max}")
    private String userTag;

    @Column(name = "USER_ORDER")
    @Range(max = 99999,min=1, message = "字段不能小于{min}或大于{max}")
    private Long userOrder; // 用户排序

    /**
     * 顶级机构，用于帐套
     */
    @Column(name = "TOP_UNIT")
    @Length(max = 32, message = "字段长度不能大于{max}")
    private String topUnit; // 顶级机构，用于帐套

    @Column(name = "PRIMARY_UNIT")
    @DictionaryMap(fieldName = "primaryUnitName", value = "unitCode")
    private String primaryUnit;

    @Column(name = "CREATE_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @ValueGenerator( strategy= GeneratorType.FUNCTION, value = "today()")
    protected Date createDate;

    /**
     * CREATOR(创建人) 创建人
     */
    @Column(name = "CREATOR")
    @Length(max = 32, message = "字段长度不能大于{max}")
    private String  creator;
       /**
     * UPDATOR(更新人) 更新人
     */
    @Column(name = "UPDATOR")
    @Length(max = 32, message = "字段长度不能大于{max}")
    private String  updator;
    /**
     * UPDATEDATE(更新时间) 更新时间
     */
    @Column(name = "UPDATE_DATE")
    @ValueGenerator(strategy = GeneratorType.FUNCTION, occasion = GeneratorTime.NEW_UPDATE,
        condition = GeneratorCondition.ALWAYS, value="today()" )
    private Date  updateDate;


    @Transient
    private String userNamePinyin; //
    // 用户的主机构，只有在数据字典中有效

    @Transient
    @JSONField(serialize=false)
    private List<UserRole> userRoles;


    @JSONField(serialize = false)
    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getRegCellPhone() {
        return regCellPhone;
    }

    public void setRegCellPhone(String regCellPhone) {
        this.regCellPhone = regCellPhone;
    }

    public String getUserWord() {
        return userWord;
    }

    public void setUserWord(String userWord) {
        this.userWord = userWord;
    }

    /**
     * 密码失效时间
     * @return  PwdExpiredTime
     */
    public Date getPwdExpiredTime() {
        return pwdExpiredTime;
    }

    public void setPwdExpiredTime(Date pwdExpiredTime) {
        this.pwdExpiredTime = pwdExpiredTime;
    }

    /**
     * default constructor
     */
    public UserInfo() {
        //userUnits = null;
        primaryUnit = null;
        userRoles = null;

        //this.userType = "U";
    }

    /**
     * minimal constructor
     * @param userCode String
     * @param userstate String
     * @param loginname String
     * @param username String
     */
    public UserInfo(String userCode, String userstate, String loginname,
                    String username) {
        this.userCode = userCode;
        this.isValid = userstate;
        this.userName = username;
        this.loginName = loginname;
        //this.userUnits = null;
        this.primaryUnit = null;
        //this.userType = "U";
        userRoles = null;
    }

    public UserInfo(String userCode, String userpin,String usertype, String userstate,
            String loginname, String username, String userdesc,
            Long logintimes, Date activeime, String topUnit) {
            this.userCode = userCode;
            this.userPin = userpin;
            this.isValid = userstate;
            this.userName = username;
            this.userType = usertype;
            this.userDesc = userdesc;
            this.loginTimes = logintimes;
            this.activeTime = activeime;
            this.topUnit = topUnit;
            this.loginName = loginname;
            // userUnits=null;
            primaryUnit = null;
    }


    public UserInfo(String userCode, String userpin,String usertype, String userstate,
                    String loginname, String username, String userdesc,
                    String usertag, String englishname,
                    Long logintimes, Date activeime, String topUnit) {
        this.userCode = userCode;
        this.userPin = userpin;
        this.isValid = userstate;
        this.userName = username;
        this.userType = usertype;
        this.userDesc = userdesc;
        this.loginTimes = logintimes;
        this.activeTime = activeime;
        this.topUnit = topUnit;
        this.loginName = loginname;
        this.userTag = usertag;
        this.englishName = englishname;
        // userUnits=null;
        primaryUnit = null;
    }

    // Property accessors
    public String getUserCode() {
        return this.userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    @JSONField(serialize = false)
    public String getUserPin() {
        return this.userPin;
    }

    public void setUserPin(String userpin) {
        this.userPin = userpin;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    @Override
    public String getUserTag() {
        return userTag;
    }

    public void setUserTag(String userTag) {
        this.userTag = userTag;
    }

    @Override
    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    /**
     * T:生效 F:无效
     *
     * @return  IsValid
     */
    public String getIsValid() {
        return this.isValid;
    }

    /**
     * @param userstate T:生效 F:无效
     */
    public void setIsValid(String userstate) {
        this.isValid = userstate;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setUserName(String username) {
        this.userName = username;
    }

    public String getUserDesc() {
        return this.userDesc;
    }

    public void setUserDesc(String userdesc) {
        this.userDesc = userdesc;
    }

    public Long getLoginTimes() {
        return this.loginTimes;
    }

    public void setLoginTimes(Long logintimes) {
        this.loginTimes = logintimes;
    }

    public String getTopUnit() {
        return this.topUnit;
    }

    public void setTopUnit(String topUnit) {
        this.topUnit = topUnit;
    }

    public String getLoginName() {
        if (loginName == null)
            return "";
        return loginName;
    }

    public void setLoginName(String loginname) {
        if(loginname==null)
            return;
        this.loginName = loginname;
    }

    public Date getActiveTime() {
        return activeTime;
    }

    public void setActiveTime(Date activetime) {
        this.activeTime = activetime;
    }

    public String getUserNamePinyin() {
        return userNamePinyin;
    }

    public void setUserNamePinyin(String usernamepinyin) {
        this.userNamePinyin = usernamepinyin;
    }

    public void setRegEmail(String regEmail) {
        this.regEmail = regEmail;
    }

    public String getRegEmail() {
        return regEmail;
    }

    public String getPrimaryUnit() {
        return primaryUnit;
    }

    public void setPrimaryUnit(String primaryUnit) {
        this.primaryUnit = primaryUnit;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getLastModifyDate() {
        return updateDate;
    }

    public void setLastModifyDate(Date lastModifyDate) {
        this.updateDate = lastModifyDate;
    }

     public String getCreator() {
            return this.creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

        public String getUpdator() {
        return this.updator;
    }

    public void setUpdator(String updator) {
        this.updator = updator;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public void copyFromIUserInfo(IUserInfo other) {
        if (other.getIsValid() != null)
            this.isValid = other.getIsValid();
        if (other.getUserType() != null)
            this.userType = other.getUserType();
        if(other.getPrimaryUnit()!=null)
            this.primaryUnit=other.getPrimaryUnit();
        if (other.getLoginName() != null)
            this.loginName = other.getLoginName();
        if (other.getUserName() != null)
            this.userName = other.getUserName();
        if (other.getUserDesc() != null)
            this.userDesc = other.getUserDesc();

        if (other.getIdCardNo() != null)
            this.idCardNo = other.getIdCardNo();
        if (other.getRegEmail() != null)
            this.regEmail = other.getRegEmail();
        if (other.getUserTag() != null)
            this.userTag = other.getUserTag();
        if (other.getEnglishName() != null)
            this.englishName =other.getEnglishName();
        if (other.getUserOrder() != null)
            this.userOrder = other.getUserOrder();
        if (other.getRegCellPhone() != null)
            this.regCellPhone = other.getRegCellPhone();
    }

    public Long getUserOrder() {
        if (userOrder == null)
            return 1000l;
        return userOrder;
    }

    public void setUserOrder(Long userorder) {
        this.userOrder = userorder;
    }

    public List<UserRole> listUserRoles() {
        if(userRoles == null) {
            userRoles = new ArrayList<>();
        }
        return userRoles;
    }

    public List<UserRole> getUserRoles(){
        if(userRoles == null) {
            userRoles = new ArrayList<>();
        }
        return userRoles;
    }

    public void setUserRoles(List<UserRole> userRoles) {
        this.userRoles = userRoles;
    }


    private void addUserRole(UserRole userrole) {
        userrole.setUserCode(this.userCode);
        this.getUserRoles().add(userrole);
    }

    private void removeUserRole(UserRole odt) {
        this.getUserRoles().remove(odt);

    }

}
