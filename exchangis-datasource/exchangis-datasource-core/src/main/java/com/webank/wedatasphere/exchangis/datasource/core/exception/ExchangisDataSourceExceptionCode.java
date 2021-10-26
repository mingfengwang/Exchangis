package com.webank.wedatasphere.exchangis.datasource.core.exception;

// 31000 ~ 31999
public enum ExchangisDataSourceExceptionCode {

    CLIENT_QUERY_DATASOURCE_ERROR(31001),
    CLIENT_GET_DATASOURCE_VERSION_ERROR(31002),
    CLIENT_GET_DATASOURCE_ERROR(31003),
    CLIENT_DATASOURCE_TEST_CONNECTION_ERROR(31004),
    CLIENT_DATASOURCE_PUBLISH_VERSION_ERROR(31005),
    CLIENT_DATASOURCE_PARAMS_GET_ERROR(31006),
    CLIENT_DATASOURCE_EXPIRE_ERROR(31007),
    CLIENT_METADATA_GET_COLUMNS_ERROR(31008),
    CLIENT_METADATA_GET_TABLES_ERROR(31009),
    CLIENT_METADATA_GET_DATABASES_ERROR(31010),
    CLIENT_DATASOURCE_DELETE_ERROR(31011),
    CLIENT_DATASOURCE_UPDATE_ERROR(31012),
    CLIENT_DATASOURCE_UPDATE_PARAMS_VERSION_ERROR(31013),
    CLIENT_DATASOURCE_CREATE_ERROR(31014),
    CLIENT_DATASOURCE_GET_TYPES_ERROR(31015),


    // 其他错误
    PARSE_JSON_ERROR(39000),    // Parse Json Error
    CONTEXT_GET_DATASOURCE_NULL(39001), // DataSource Context Error

    ;

    private int code;

    ExchangisDataSourceExceptionCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}