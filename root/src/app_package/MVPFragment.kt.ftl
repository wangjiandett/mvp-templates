package ${packageName}.mvp.view;

import android.view.View;
import com.moa.baselib.base.ui.BaseFragment;
import ${packageName}.R
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>
import ${packageName}.mvp.contract.${mvpName}Contract
import ${packageName}.mvp.model.${mvpName}Model
import ${packageName}.mvp.presenter.${mvpName}Presenter

/**
 * ${fragmentClass}
 *
 * @author wangjian
 * Created on 2020/12/23 9:54
 */
class ${fragmentClass} : BaseFragment(), ${mvpName}Contract.I${mvpName}View {

	private var m${mvpName}Presenter: ${mvpName}Presenter? = null

    override fun getLayoutId(): Int {
		<#if generateLayout>
			return R.layout.${layoutName}
		<#else>
			return 0
		</#if>
    }

    override fun initView(view: View) {
	
	}
	
    override fun initData() {
		m${mvpName}Presenter = ${mvpName}Presenter(this, ${mvpName}Model())
		loadData()
	}
	
	fun loadData(){
    <#if needRequestMap>
        val request = hashMapOf<String, String>()
        m${mvpName}Presenter?.send${mvpName}Request(request)
    <#else>
        m${mvpName}Presenter?.send${mvpName}Request()
    </#if>
    }
	
	override fun on${mvpName}Success(response: <#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?) {
		initViewWithData(response)
    }

    override fun onFail(msg: String?) {
        showToast(msg)
    }
	
	private fun initViewWithData(response: <#if userObjectAsResponse>Any<#else>${mvpName}Response</#if>?) {
        
    }
}