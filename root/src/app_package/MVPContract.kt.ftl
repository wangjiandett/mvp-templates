package ${packageName}.mvp.contract;

import com.moa.baselib.base.net.mvp.ValueCallback;
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>

/**
 * ${describe}Contract
 *
 * @author wangjian
 * Created on 2020/9/30 17:12
 */
interface ${mvpName}Contract {
    interface I${mvpName}Model {
        fun send${mvpName}Request(<#if needRequestMap> request: Map<String, String>, </#if> callback: ValueCallback<<#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?>?)
    }

    interface I${mvpName}Presenter {
        fun send${mvpName}Request(<#if needRequestMap> request: Map<String, String></#if>)
    }

    interface I${mvpName}View {
        fun on${mvpName}Success(response: <#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?)
        fun onFail(code: Int, msg: String?)
    }
}
