package ${packageName}.mvp.contract;

import com.moa.baselib.base.net.mvp.ValueCallback;
<#if !userObjectAsResponse>
import ${packageName}.mvp.bean.${mvpName}Response
</#if>

import java.util.Map;

/**
 * ${describe}Contract
 *
 * @author wangjian
 * Created on 2020/9/30 17:12
 */
public interface ${mvpName}Contract {

    interface I${mvpName}Model {
        void send${mvpName}Request(<#if needRequestMap>Map<String, String> request, </#if>ValueCallback<<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if>> callback);
    }

    interface I${mvpName}Presenter{
        void send${mvpName}Request(<#if needRequestMap>Map<String, String> request</#if>);
    }
    
    interface I${mvpName}View{
        void on${mvpName}Success(<#if userObjectAsResponse>Object<#else>${mvpName}Response</#if> response);
        void onFail(int code, String msg);
    }
}
