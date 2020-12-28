package ${packageName}.mvp.model;

import com.moa.baselib.base.net.mvp.ValueCallback;
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>
import ${packageName}.mvp.contract.${mvpName}Contract;
import ${packageName}.net.ApiCreator;
import ${packageName}.net.AppModel;

import java.util.Map;

/**
 * ${mvpName}Model
 * <p>
 * Created by：wangjian on 2017/12/21 11:00
 */
public class ${mvpName}Model extends AppModel<<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if>> implements ${mvpName}Contract.I${mvpName}Model {

    @Override
    public void send${mvpName}Request(<#if needRequestMap>Map<String, String> request, </#if>ValueCallback<<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if>> callback) {
        this.mCallback = callback;
        request(ApiCreator.apiInterfaces.send${mvpName}Request(<#if needRequestMap>request</#if>));
    }

    @Override
    protected void onSuccess(<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if> value) {
        mCallback.onSuccess(value);
    }

    @Override
    protected void onFail(String msg) {
        mCallback.onFail(msg);
    }

}
