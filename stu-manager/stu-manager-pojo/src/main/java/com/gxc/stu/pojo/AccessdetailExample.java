package com.gxc.stu.pojo;

import java.util.ArrayList;
import java.util.List;

public class AccessdetailExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AccessdetailExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIpIsNull() {
            addCriterion("ip is null");
            return (Criteria) this;
        }

        public Criteria andIpIsNotNull() {
            addCriterion("ip is not null");
            return (Criteria) this;
        }

        public Criteria andIpEqualTo(String value) {
            addCriterion("ip =", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotEqualTo(String value) {
            addCriterion("ip <>", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpGreaterThan(String value) {
            addCriterion("ip >", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpGreaterThanOrEqualTo(String value) {
            addCriterion("ip >=", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLessThan(String value) {
            addCriterion("ip <", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLessThanOrEqualTo(String value) {
            addCriterion("ip <=", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLike(String value) {
            addCriterion("ip like", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotLike(String value) {
            addCriterion("ip not like", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpIn(List<String> values) {
            addCriterion("ip in", values, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotIn(List<String> values) {
            addCriterion("ip not in", values, "ip");
            return (Criteria) this;
        }

        public Criteria andIpBetween(String value1, String value2) {
            addCriterion("ip between", value1, value2, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotBetween(String value1, String value2) {
            addCriterion("ip not between", value1, value2, "ip");
            return (Criteria) this;
        }

        public Criteria andIplocationIsNull() {
            addCriterion("ipLocation is null");
            return (Criteria) this;
        }

        public Criteria andIplocationIsNotNull() {
            addCriterion("ipLocation is not null");
            return (Criteria) this;
        }

        public Criteria andIplocationEqualTo(String value) {
            addCriterion("ipLocation =", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationNotEqualTo(String value) {
            addCriterion("ipLocation <>", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationGreaterThan(String value) {
            addCriterion("ipLocation >", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationGreaterThanOrEqualTo(String value) {
            addCriterion("ipLocation >=", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationLessThan(String value) {
            addCriterion("ipLocation <", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationLessThanOrEqualTo(String value) {
            addCriterion("ipLocation <=", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationLike(String value) {
            addCriterion("ipLocation like", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationNotLike(String value) {
            addCriterion("ipLocation not like", value, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationIn(List<String> values) {
            addCriterion("ipLocation in", values, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationNotIn(List<String> values) {
            addCriterion("ipLocation not in", values, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationBetween(String value1, String value2) {
            addCriterion("ipLocation between", value1, value2, "iplocation");
            return (Criteria) this;
        }

        public Criteria andIplocationNotBetween(String value1, String value2) {
            addCriterion("ipLocation not between", value1, value2, "iplocation");
            return (Criteria) this;
        }

        public Criteria andResourcepathIsNull() {
            addCriterion("resourcePath is null");
            return (Criteria) this;
        }

        public Criteria andResourcepathIsNotNull() {
            addCriterion("resourcePath is not null");
            return (Criteria) this;
        }

        public Criteria andResourcepathEqualTo(String value) {
            addCriterion("resourcePath =", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathNotEqualTo(String value) {
            addCriterion("resourcePath <>", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathGreaterThan(String value) {
            addCriterion("resourcePath >", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathGreaterThanOrEqualTo(String value) {
            addCriterion("resourcePath >=", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathLessThan(String value) {
            addCriterion("resourcePath <", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathLessThanOrEqualTo(String value) {
            addCriterion("resourcePath <=", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathLike(String value) {
            addCriterion("resourcePath like", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathNotLike(String value) {
            addCriterion("resourcePath not like", value, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathIn(List<String> values) {
            addCriterion("resourcePath in", values, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathNotIn(List<String> values) {
            addCriterion("resourcePath not in", values, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathBetween(String value1, String value2) {
            addCriterion("resourcePath between", value1, value2, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andResourcepathNotBetween(String value1, String value2) {
            addCriterion("resourcePath not between", value1, value2, "resourcepath");
            return (Criteria) this;
        }

        public Criteria andComedateIsNull() {
            addCriterion("comeDate is null");
            return (Criteria) this;
        }

        public Criteria andComedateIsNotNull() {
            addCriterion("comeDate is not null");
            return (Criteria) this;
        }

        public Criteria andComedateEqualTo(String value) {
            addCriterion("comeDate =", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateNotEqualTo(String value) {
            addCriterion("comeDate <>", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateGreaterThan(String value) {
            addCriterion("comeDate >", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateGreaterThanOrEqualTo(String value) {
            addCriterion("comeDate >=", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateLessThan(String value) {
            addCriterion("comeDate <", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateLessThanOrEqualTo(String value) {
            addCriterion("comeDate <=", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateLike(String value) {
            addCriterion("comeDate like", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateNotLike(String value) {
            addCriterion("comeDate not like", value, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateIn(List<String> values) {
            addCriterion("comeDate in", values, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateNotIn(List<String> values) {
            addCriterion("comeDate not in", values, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateBetween(String value1, String value2) {
            addCriterion("comeDate between", value1, value2, "comedate");
            return (Criteria) this;
        }

        public Criteria andComedateNotBetween(String value1, String value2) {
            addCriterion("comeDate not between", value1, value2, "comedate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}