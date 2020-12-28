package ${packageName}.mvp.model;

import com.moa.baselib.base.net.mvp.ValueCallback;
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>
import ${packageName}.mvp.contract.${mvpName}Contract;
import ${packageName}.net.ApiCreator
import ${packageName}.net.AppModel

/**
 * ${mvpName}Model
 *
 * Created by：wangjian on 2017/12/21 11:00
 */
class ${mvpName}Model : AppModel<<#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?>(), ${mvpName}Contract.I${mvpName}Model {

    override fun send${mvpName}Request(<#if needRequestMap> request: Map<String, String>, </#if>callback: ValueCallback<<#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?>?) {
        mCallback = callback
        request(ApiCreator.apiInterfaces.send${mvpName}Request(<#if needRequestMap>request</#if>))
    }

    override fun onShowProgress() { // optional
        mCallback.onShowProgress()
    }

    override fun onHideProgress() { // optional
        mCallback.onHideProgress()
    }

    override fun onSuccess(value: <#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?) {
        mCallback.onSuccess(value)
    }

    override fun onFail(msg: String) {
        mCallback.onFail(msg)
    }
}
