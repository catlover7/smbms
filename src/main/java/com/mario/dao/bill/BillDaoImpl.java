package com.mario.dao.bill;

import com.mario.dao.BaseDao;
import com.mario.pojo.Bill;
import com.mysql.cj.util.StringUtils;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BillDaoImpl  implements BillDao{
    //根据用户输入的值，新增表单
    public int add(Connection connection, Bill bill) throws Exception {
        int updateNum=0;
        PreparedStatement pstm=null;
        if(connection!=null){
//            String sql = "insert into smbms_bill (billCode,proProfession,productDesc," +
//                    "totalPrice,isPayment,providerId,createdBy,creationDate,userLabel) " +
//                    "values(?,?,?,?,?,?,?,?,?)";

            String sql = "insert into smbms_bill (billCode,proProfession,productDesc," +
                    "proGrade,workExperience,totalPrice,isPayment,providerId,createdBy,creationDate,userLabel) " +
                    "values(?,?,?,?,?,?,?,?,?,?,?)";
            Object[] params = {bill.getBillCode(),bill.getProProfession(),bill.getProductDesc(),
                    bill.getProGrade(),bill.getWorkExperience(),bill.getTotalPrice(),bill.getIsPayment(),
                    bill.getProviderId(),bill.getCreatedBy(),bill.getCreationDate(),bill.getUserLabel()};
            updateNum = BaseDao.execute(connection, sql, params,pstm);
            BaseDao.closeResource(null, pstm, null);
            System.out.println("dao--------修改行数 " + updateNum);
        }
        return updateNum;
    }

    //根据用户输入的值条件，查询表单表
    public List<Bill> getBillList(Connection connection, Bill bill) throws Exception {
        List<Bill> billList = new ArrayList<Bill>();
        PreparedStatement pstm=null;
        ResultSet rs=null;
        if(connection!=null){
            StringBuffer sql=new StringBuffer();
            sql.append("SELECT b.*,p.proName AS providerName,s.userName AS userName FROM smbms_bill b, smbms_provider p,smbms_user s WHERE b.providerId = p.id and s.id=b.createdBy");
            List<Object> list = new ArrayList<Object>();//用来暂存用户的输入
            if(!StringUtils.isNullOrEmpty(bill.getProProfession())){//判断用户是否输入职位名称
                sql.append(" AND b.`proProfession` LIKE ?");
                list.add("%"+bill.getProProfession()+"%");
            }
            if(!StringUtils.isNullOrEmpty(bill.getUserLabel())){//判断用户是否输入申请人名
                sql.append(" AND b.`userLabel` LIKE ?");
                list.add("%"+bill.getUserLabel()+"%");
            }
            if(bill.getProviderId()>0){//判断是否选择了公司
                sql.append(" AND p.`providerId`=?");
                list.add(bill.getProviderId());
            }if(bill.getIsPayment()>0){//判断是否选择了是否录用
                sql.append(" AND b.`isPayment`=?");
                list.add(bill.getIsPayment());
            }
            Object[] params=list.toArray();
            rs= BaseDao.execute(connection, sql.toString(), params, rs, pstm);
            System.out.println("当前的sql是----->"+sql.toString());
            while(rs.next()){
                Bill _bill = new Bill();//创建一个bill对象存储查询到的属性
                _bill.setId(rs.getInt("id"));
                _bill.setBillCode(rs.getString("billCode"));
                _bill.setProProfession(rs.getString("proProfession"));
                _bill.setProductDesc(rs.getString("productDesc"));
                _bill.setProGrade(rs.getString("proGrade"));
                _bill.setWorkExperience(rs.getString("workExperience"));
                _bill.setTotalPrice(rs.getString("totalPrice"));
                _bill.setIsPayment(rs.getInt("isPayment"));
                _bill.setProviderId(rs.getInt("providerId"));
                _bill.setProviderName(rs.getString("providerName"));
                _bill.setUserName(rs.getString("userName"));
                _bill.setCreationDate(rs.getTimestamp("creationDate"));
                _bill.setCreatedBy(rs.getInt("createdBy"));
                //new 姓名
                _bill.setUserLabel(rs.getString("userLabel"));
                billList.add(_bill);
            }
            BaseDao.closeResource(null,pstm,rs);
        }

        return billList;
    }

    //根据表单id删除该表单
    public int deleteBillById(Connection connection, String delId) throws Exception {
        int delNum=0;
        PreparedStatement pstm=null;
        if(connection!=null){
            String sql="DELETE FROM `smbms_bill` WHERE id=?";
            Object[] params={delId};
            delNum = BaseDao.execute(connection, sql, params, pstm);
            BaseDao.closeResource(null,pstm,null);
        }
        return delNum;
    }

    //通过订单id得到该表单的所有信息（正确）
    public Bill getBillById(Connection connection, String id) throws Exception {
        // TODO Auto-generated method stub
        Bill bill = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        if(null != connection){
            String sql = "select b.*,p.proName as providerName from smbms_bill b, smbms_provider p " +
                    "where b.providerId = p.id and b.id=?";
            Object[] params = {id};
            rs = BaseDao.execute(connection,sql, params,rs,pstm);
            if(rs.next()){
                bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setBillCode(rs.getString("billCode"));
                bill.setProProfession(rs.getString("proProfession"));
                bill.setProductDesc(rs.getString("productDesc"));
                bill.setProGrade(rs.getString("proGrade"));
                bill.setWorkExperience(rs.getString("workExperience"));
                bill.setTotalPrice(rs.getString("totalPrice"));
                bill.setIsPayment(rs.getInt("isPayment"));
                bill.setProviderId(rs.getInt("providerId"));
                bill.setProviderName(rs.getString("providerName"));
                bill.setModifyBy(rs.getInt("modifyBy"));
                bill.setModifyDate(rs.getTimestamp("modifyDate"));

                //new
                bill.setUserLabel(rs.getString("userLabel"));
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return bill;
    }

    //根据用户传递输入的值修改录用表单
    public int modify(Connection connection, Bill bill) throws Exception {
        int modifyNum=0;
        PreparedStatement pstm=null;
        if(connection!=null){
//            String sql = "update smbms_bill set proProfession=?," +
//                    "productDesc=?,totalPrice=?," +
//                    "isPayment=?,providerId=?,modifyBy=?,modifyDate=? where id = ? ";

            String sql = "update smbms_bill set proProfession=?," +
                    "productDesc=?,proGrade=?,workExperience=?,totalPrice=?," +
                    "isPayment=?,providerId=?,modifyBy=?,modifyDate=?,userLabel=? where id = ? ";
            Object[] params = {bill.getProProfession(),bill.getProductDesc(),
                    bill.getProGrade(),bill.getWorkExperience(),bill.getTotalPrice(),bill.getIsPayment(),
                    bill.getProviderId(),bill.getModifyBy(),bill.getModifyDate(),bill.getUserLabel(),bill.getId()};
            modifyNum=BaseDao.execute(connection,sql,params,pstm);
            BaseDao.closeResource(null,pstm,null);
        }
        return modifyNum;
    }

    //通过公司id得到该公司总录用情况
    public int getBillCountByProviderId(Connection connection, String providerId) throws Exception {
        int billcount=0;
        PreparedStatement pstm=null;
        ResultSet rs=null;
        if(connection!=null){
            String sql="SELECT COUNT(1) as billCount FROM `smbms_bill` WHERE `providerId`=?";
            Object[] params={providerId};
            rs = BaseDao.execute(connection, sql, params, rs, pstm);
            while(rs.next()){
                billcount=rs.getInt("billCount");
            }
            BaseDao.closeResource(null,pstm,rs);
        }
        return billcount;
    }
    @Test
    public void test(){
        BillDaoImpl billDao = new BillDaoImpl();
        Bill bill=null;
        Connection connection=BaseDao.getConnection();
        try {
            bill = new Bill();
            bill.setIsPayment(1);
            bill.setUserLabel("hzw");
            bill.setProviderId(1003);
            int add = billDao.add(connection, bill);
        } catch (Exception e) {
            e.printStackTrace();
        }
        BaseDao.closeResource(connection,null,null);

    }

}
