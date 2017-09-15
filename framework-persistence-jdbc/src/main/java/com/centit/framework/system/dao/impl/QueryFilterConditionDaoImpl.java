package com.centit.framework.system.dao.impl;

import com.centit.framework.core.dao.CodeBook;
import com.centit.framework.jdbc.dao.BaseDaoImpl;
import com.centit.framework.jdbc.dao.DatabaseOptUtils;
import com.centit.framework.system.dao.QueryFilterConditionDao;
import com.centit.framework.system.po.QueryFilterCondition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;


/**
 * QueryFilterConditionDao  Repository.
 * create by scaffold 2016-03-01 
 * @author codefan@sina.com
 * 系统内置查询方式null   
*/

@Repository("queryFilterConditionDao")
public class QueryFilterConditionDaoImpl extends BaseDaoImpl<QueryFilterCondition,Long>
        implements QueryFilterConditionDao {

    public static final Logger logger = LoggerFactory.getLogger(QueryFilterConditionDaoImpl.class);

    @Override
    public Map<String, String> getFilterField() {
        if( filterField == null){
            filterField = new HashMap<>();
            filterField.put("conditionNo" , CodeBook.EQUAL_HQL_ID);
            filterField.put("tableClassName" , CodeBook.EQUAL_HQL_ID);
            filterField.put("paramName" , CodeBook.EQUAL_HQL_ID);
            filterField.put("paramLabel" , CodeBook.EQUAL_HQL_ID);
            filterField.put("paramType" , CodeBook.EQUAL_HQL_ID);
            filterField.put("defaultValue" , CodeBook.EQUAL_HQL_ID);
            filterField.put("filterSql" , CodeBook.EQUAL_HQL_ID);
            filterField.put("selectDataType" , CodeBook.EQUAL_HQL_ID);
            filterField.put("selectDataCatalog" , CodeBook.EQUAL_HQL_ID);
            filterField.put("selectSql" , CodeBook.EQUAL_HQL_ID);
            filterField.put("selectJson" , CodeBook.EQUAL_HQL_ID);
        }
        return filterField;
    }

    @Transactional
    public Long getNextKey() {
        return DatabaseOptUtils.getSequenceNextValue(this, "S_FILTER_NO");
    }

    @Override
    public QueryFilterCondition getObjectById(Long filterNo) {
        return super.getObjectById(filterNo);
    }

    @Override
    public void deleteObjectById(Long filterNo) {
        super.deleteObjectById(filterNo);
    }
}
