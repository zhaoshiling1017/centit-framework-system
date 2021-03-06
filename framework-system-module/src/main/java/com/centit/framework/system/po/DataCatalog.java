package com.centit.framework.system.po;

import com.centit.framework.core.dao.DictionaryMap;
import com.centit.framework.model.basedata.IDataCatalog;
import com.centit.support.database.orm.GeneratorCondition;
import com.centit.support.database.orm.GeneratorTime;
import com.centit.support.database.orm.GeneratorType;
import com.centit.support.database.orm.ValueGenerator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.springframework.util.CollectionUtils;
import org.springframework.web.util.HtmlUtils;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * DataCatalog entity.
 *
 * @author codefan@codefan.com
 */
@Entity
@Table(name = "F_DATACATALOG")
@ApiModel(value="数据字典类别对象",description="数据字典类别对象DataCatalog")
public class DataCatalog implements IDataCatalog, java.io.Serializable{
    private static final long serialVersionUID = 1L;

    /**
     * 类别代码
     */
    @Id
    @Column(name = "CATALOG_CODE")
    @ApiModelProperty(value = "类别代码",name = "catalogCode",required = true)
    @ValueGenerator(strategy = GeneratorType.UUID22)
    private String catalogCode;

    /**
     * 类别名称
     */
    @Column(name = "CATALOG_NAME")
    @Length(max = 64, message = "字段长度不能大于{max}")
    @ApiModelProperty(value = "类别名称",name = "catalogName",required = true)
    private String catalogName;

    /**
     * 类别状态
     */
    @Column(name = "CATALOG_STYLE")
    @ValueGenerator(strategy = GeneratorType.CONSTANT, occasion = GeneratorTime.NEW, value = "U")
    @Length(max = 1, message = "字段长度必须为{max}")
    @Pattern(regexp = "[SUF]", message = "字段只能填写F,S,U")
    @ApiModelProperty(value = "类别状态 字段只能填写F,S,U",name = "catalogStyle",required = true)
    @DictionaryMap(fieldName = "catalogStyleText", value = "CatalogStyle")
    private String catalogStyle;

    /**
     * 类别形式 L或T
     */
    @Column(name = "CATALOG_TYPE")
    @ValueGenerator(strategy = GeneratorType.CONSTANT, occasion = GeneratorTime.NEW, value = "L")
    @Length(max = 1, message = "字段长度必须为{max}")
    @Pattern(regexp = "[LT]", message = "字段只能填写L或T")
    @ApiModelProperty(value = "字段只能填写L(列表)或T(树)",name = "catalogType",required = true)
    @DictionaryMap(fieldName = "catalogTypeText", value = "CatalogType")
    private String catalogType;

    /**
     * 类别描述
     */
    @Column(name = "CATALOG_DESC")
    @Length(max = 256, message = "字段长度不能大于{max}")
    private String catalogDesc;

    /**
     * 字典字段描述
     */
    @Column(name = "FIELD_DESC")
    @Length(max = 1024, message = "字段长度不能大于{max}")
    private String fieldDesc;

    /**
     * 是否需要缓存
     */
    @Column(name = "NEED_CACHE")
    @Length(max = 1, message = "字段长度必须为{max}")
    @ValueGenerator(strategy = GeneratorType.CONSTANT, occasion = GeneratorTime.NEW, value = "1")
    @ApiModelProperty(value = "是否需要缓存，字段不能为空可以默认设置为1",name = "needCache",required = true)
    private String needCache;

    /**
     * 归属系统，一般为一个业务菜单的ID
     * 内置变量 system 系统数据字典 public 公用数据字典
     */
    @Column(name = "OPT_ID")
    @Length(max = 32, message = "字段长度不能大于{max}")
    @DictionaryMap(fieldName="optName", value="optId")
    @ValueGenerator(strategy = GeneratorType.CONSTANT, occasion = GeneratorTime.NEW, value = "public")
    private String optId;

    @Column(name = "CREATE_DATE", nullable = false)
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
    private List<DataDictionary> dataDictionaries;

    /** default constructor */
    /**
     * minimal constructor
     *
     * @param catalogcode catalogcode
     * @param catalogname catalogname
     * @param catalogstyle catalogstyle
     * @param catalogtype catalogtype
     * @param isupload isupload
     */
    public DataCatalog(String catalogcode, String catalogname, String catalogstyle, String catalogtype, String isupload) {

        this.catalogCode = catalogcode;

        this.catalogName = catalogname;
        this.catalogStyle = catalogstyle;
        this.catalogType = catalogtype;
        this.needCache = "1";
    }

    public String getCatalogCode() {
        return this.catalogCode;
    }

    public void setCatalogCode(String catalogcode) {
        this.catalogCode = catalogcode;
    }

    // Property accessors

    public String getOptId() {
        return optId;
    }

    public void setOptId(String dictionarytype) {
        this.optId = dictionarytype;
    }

    public String getCatalogName() {
        return this.catalogName;
    }

    public void setCatalogName(String catalogname) {
        this.catalogName = catalogname;
    }

    public String getCatalogStyle() {
        return this.catalogStyle;
    }

    public void setCatalogStyle(String catalogstyle) {
        this.catalogStyle = catalogstyle;
    }

    public String getCatalogType() {
        return this.catalogType;
    }

    public void setCatalogType(String catalogtype) {
        this.catalogType = catalogtype;
    }

    public String getCatalogDesc() {
        return this.catalogDesc;
    }

    public void setCatalogDesc(String catalogdesc) {
        this.catalogDesc = catalogdesc;
    }

    public String getFieldDesc() {
        return this.fieldDesc;
    }

    public void setFieldDesc(String fielddesc) {

        if (StringUtils.isNotBlank(fielddesc)) {
            fielddesc = HtmlUtils.htmlUnescape(fielddesc);
        }

        this.fieldDesc = fielddesc;
    }

    public void setIsUpload(String isupload) {
    }

    /**
     * @return the needCache
     */
    public String getNeedCache() {
        return needCache;
    }

    /**
     * @param needCache the needCache to set
     */
    public void setNeedCache(String needCache) {
        this.needCache = needCache;
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
     public void addAllDataPiece(List<DataDictionary> dataDictionaries) {
        getDataDictionaries().clear();

        if (CollectionUtils.isEmpty(dataDictionaries)) {
            return;
        }

        for (DataDictionary dataDictionary : dataDictionaries) {
            dataDictionary.setCatalogCode(this.catalogCode);
            getDataDictionaries().add(dataDictionary);
        }
    }

    public List<DataDictionary> getDataDictionaries() {
        if (null == dataDictionaries) {
            dataDictionaries = new ArrayList<>();
        }
        return dataDictionaries;
    }

    public void setDataDictionaries(List<DataDictionary> dataDictionaries) {
        this.dataDictionaries = dataDictionaries;
    }

    public DataCatalog() {
    }

}
