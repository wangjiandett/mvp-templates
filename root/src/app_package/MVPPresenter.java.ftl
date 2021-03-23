package ${packageName}.mvp.presenter;

import com.moa.baselib.base.net.mvp.SimpleValueCallback;
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>
import ${packageName}.mvp.contract.${mvpName}Contract;

import java.util.Map;

/**
 * ${describe}Presenter
 * <p>
 * Created by：wangjian on 2017/12/21 15:45
 */
public class ${mvpName}Presenter implements ${mvpName}Contract.I${mvpName}Presenter {

    private ${mvpName}Contract.I${mvpName}View i${mvpName}View;
    private ${mvpName}Contract.I${mvpName}Model i${mvpName}Model;

    public ${mvpName}Presenter(${mvpName}Contract.I${mvpName}View i${mvpName}View, ${mvpName}Contract.I${mvpName}Model i${mvpName}Model) {
        this.i${mvpName}View = i${mvpName}View;
        this.i${mvpName}Model = i${mvpName}Model;
    }

    @Override
    public void send${mvpName}Request(<#if needRequestMap>Map<String, String> request</#if>) {
        i${mvpName}Model.send${mvpName}Request(<#if needRequestMap>request, </#if>new SimpleValueCallback<<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if>>() {
            @Override
            public void onSuccess(<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if> response) {
                i${mvpName}View.on${mvpName}Success(response);
            }

            @Override
            public void onFail(int code, String msg) {
                i${mvpName}View.onFail(code, msg);
            }
        });
    }
}
