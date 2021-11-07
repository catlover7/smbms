package com.mario.dao.provider;

import com.mario.pojo.Provider;

import java.sql.Connection;
import java.util.List;

public interface ProviderDao {
    /**
     * 增加企业
     * @param connection
     * @param provider
     * @return
     * @throws Exception
     */
    public int add(Connection connection, Provider provider)throws Exception;


    /**
     * 通过企业称、编码获取企业列表-模糊查询-providerList
     * @param connection
     * @param proName
     * @return
     * @throws Exception
     */
    public List<Provider> getProviderList(Connection connection, String proName, String proCode)throws Exception;

    /**
     * 通过proId删除Provider
     * @param delId
     * @return
     * @throws Exception
     */
    public int deleteProviderById(Connection connection, String delId)throws Exception;


    /**
     * 通过proId获取Provider
     * @param connection
     * @param id
     * @return
     * @throws Exception
     */
    public Provider getProviderById(Connection connection, String id)throws Exception;

    /**
     * 修改用户信息
     */
    public int modify(Connection connection, Provider provider)throws Exception;
}
