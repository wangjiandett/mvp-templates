package ${packageName}.mvp.presenter;

import com.moa.baselib.base.net.mvp.SimpleValueCallback;
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>
import ${packageName}.mvp.contract.${mvpName}Contract;

/**
 * ${describe}Presenter
 *
 * @author wangjian
 * Created on 2020/9/30 17:12
 */
class ${mvpName}Presenter(private val iView: ${mvpName}Contract.I${mvpName}View, private val iModel: ${mvpName}Contract.I${mvpName}Model) : ${mvpName}Contract.I${mvpName}Presenter {
   
   override fun send${mvpName}Request(<#if needRequestMap> request: Map<String, String></#if>) {
        iModel.send${mvpName}Request(<#if needRequestMap> request, </#if> object : SimpleValueCallback<<#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?>() {
            override fun onSuccess(response: <#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?) {
                iView.on${mvpName}Success(response)
            }

            override fun onFail(code: Int, msg: String) {
                iView.onFail(code, msg)
            }
        })
    }
}
