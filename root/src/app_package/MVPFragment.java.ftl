package ${packageName}.mvp.view;

import android.view.View;
import com.moa.baselib.base.ui.BaseFragment;
<#if generateLayout>
import ${packageName}.R;
</#if>  
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>
import ${packageName}.mvp.contract.${mvpName}Contract;
import ${packageName}.mvp.model.${mvpName}Model;
import ${packageName}.mvp.presenter.${mvpName}Presenter;

import java.util.HashMap;

/**
 * ${fragmentClass}
 *
 * @author wangjian
 * Created on 2020/12/23 9:54
 */
public class ${fragmentClass} extends BaseFragment implements ${mvpName}Contract.I${mvpName}View {

	private ${mvpName}Presenter m${mvpName}Presenter;

    @Override
    protected int getLayoutId() {
	<#if generateLayout>
        return R.layout.${layoutName};
	<#else>
		return 0;
	</#if>    
    }

    @Override
    protected void initView(View view) {

    }

    @Override
    protected void initData() {
        m${mvpName}Presenter = new ${mvpName}Presenter(this, new ${mvpName}Model());
		loadData();
    }
	
	private void loadData(){
    <#if needRequestMap>
        HashMap<String, String> request = new HashMap<String, String>();
        m${mvpName}Presenter.send${mvpName}Request(request);
    <#else>
        m${mvpName}Presenter.send${mvpName}Request();
    </#if>
    }

    @Override
    public void on${mvpName}Success(<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if> response) {
		initViewWithData(response);
    }

    @Override
    public void onFail(String msg) {
        showToast(msg);
    }
	
	private void initViewWithData(<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if> response) {
        
    }
}

