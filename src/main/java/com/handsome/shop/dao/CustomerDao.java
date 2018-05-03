package com.handsome.shop.dao;

import com.handsome.shop.entity.Customer;
import com.handsome.shop.framework.Dao;

import java.util.List;
import java.util.Map;

/**
 * by wangrongjun on 2017/6/17.
 */
public interface CustomerDao extends Dao<Customer> {

    Customer queryByPhone(String phone);

    boolean updateHeadUrl(int customerId, String headUrl);

    /**
     * @return map contains key "gender", "count"
     */
    List<Map<String, Object>> countGender();

}
