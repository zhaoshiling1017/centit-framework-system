package com.centit.framework.system.po;

import com.centit.framework.core.dao.DictionaryMap;
import com.centit.framework.model.basedata.IUserUnit;
import com.centit.support.database.orm.GeneratorCondition;
import com.centit.support.database.orm.GeneratorTime;
import com.centit.support.database.orm.GeneratorType;
import com.centit.support.database.orm.ValueGenerator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.Date;

/**
 * FUserunit entity.
 *
 * @author MyEclipse Persistence Tools
 */
// 用户所属机构表
@Entity
@Table(name = "F_USERUNIT")
@ApiModel(value="系统用户机构对象",description="系统用户机构对象 UserUnit")
public class UserUnit implements IUserUnit, java.io.Serializable {

    // Fields
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "USER_UNIT_ID")
    //@GeneratedValue(generator = "assignedGenerator")
    @Length(max = 64)
    @ApiModelProperty(value = "用户机构ID",name = "userUnitId")
    private String userUnitId;

    @Column(name = "UNIT_CODE")
    @DictionaryMap(fieldName="unitName",value="unitCode")
    @ApiModelProperty(value = "机构代码",name = "unitCode")
    private String unitCode; // 机构代码

    @Column(name = "USER_CODE")
    @DictionaryMap(fieldName="userName",value="userCode")
    @ApiModelProperty(value = "用户代码",name = "userCode")
    private String userCode; // 用户代码

    @Column(name = "USER_STATION")
    @Length(max = 32, message = "字段长度不能大于{max}")
    @DictionaryMap(fieldName="userStationText",value="StationType")
    @ApiModelProperty(value = "岗位",name = "userStation")
    private String userStation; // 岗位

    @Column(name = "USER_RANK")
    @Length(max = 32, message = "字段长度不能大于{max}")
    @DictionaryMap(fieldName="userRankText",value="RankType")
    @ApiModelProperty(value = "职务",name = "userRank")
    private String userRank; // 职务

    @Column(name = "RANK_MEMO")
    @Length(max = 256, message = "字段长度不能大于{max}")
    private String rankMemo; // 备注

    @Column(name = "IS_PRIMARY")
    @NotBlank(message = "字段不能为空")
    @Length(max = 1, message = "字段长度必须为{max}")
    private String isPrimary; // 是否为主

    @Column(name = "USER_ORDER")
    private Long userOrder;    //用户排序号

    @Column(name = "CREATE_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @ValueGenerator( strategy= GeneratorType.FUNCTION, value = "today()")
    protected Date createDate;

    @Transient
    private String unitName; // 机构名称

    //创建人、更新人、更新时间
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
    //结束


    /**
     * 仅在系统缓存中使用
     */
    @Transient
    private int xzRank;

    // Constructors

    /**
     * default constructor
     */
    public UserUnit() {
    }

    public String getUserUnitId() {
        return userUnitId;
    }

    public void setUserUnitId(String userunitid) {
        this.userUnitId = userunitid;
    }

    /**
     * minimal constructor
     * @param id String
     * @param isprimary String
     */
    public UserUnit(String id, String isprimary) {
        this.userUnitId = id;
        this.isPrimary = isprimary;
    }

    /**
     * full constructor
     * @param id String
     * @param userstation String
     * @param userrank String
     * @param isprimary String
     */
    public UserUnit(String id, String userstation, String userrank,
                    String isprimary) {
        this.userUnitId = id;
        this.userStation = userstation;
        this.userRank = userrank;
        this.isPrimary = isprimary;
    }

    // Property accessors


    public String getUserStation() {
        return this.userStation;
    }

    public void setUserStation(String userstation) {
        this.userStation = userstation;
    }

    public String getUserRank() {
        return this.userRank;
    }

    public void setUserRank(String userrank) {
        this.userRank = userrank;
    }

    // Property accessors

    public String getUnitCode() {
        return this.unitCode;
    }

    public void setUnitCode(String unitcode) {
        this.unitCode = unitcode;
    }

    public String getUserCode() {
        return this.userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getRankMemo() {
        return this.rankMemo;
    }

    public void setRankMemo(String rankmemo) {
        this.rankMemo = rankmemo;
    }

    /**
     * T:主机构 F：辅机构
     * @return  IsPrimary
     */
    public String getIsPrimary() {
        return this.isPrimary;
    }
    /**
     * @param isprimary T:主机构 F：辅机构
     */
    public void setIsPrimary(String isprimary) {
        this.isPrimary = isprimary;
    }


    public void setUnitName(String unitname) {
        this.unitName = unitname;
    }

    public int getXzRank() {
        return xzRank;
    }

    public void setXzRank(int xzRank) {
        this.xzRank = xzRank;
    }

    public Long getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(Long userorder) {
        this.userOrder = userorder;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    //创建人、更新人、更新时间
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

    public Date getLastModifyDate() {
        return updateDate;
    }

    public void setLastModifyDate(Date lastModifyDate) {
        this.updateDate = lastModifyDate;
    }
    //结束
}
