<#macro login path isRegisterForm>
<form action="${path}" method="post" novalidate >

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="username" placeholder="User name" />
            </div>
    </div>
    <#if isRegisterForm>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Email : </label>
        <div class="col-sm-5">
            <input class="form-control" type="email" name="email" placeholder="some@some.com" />
        </div>
    </div>
    </#if>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password : </label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="password" placeholder="Password" />
            </div>
    </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><a href="/registration">Registration</a></#if>
    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign in</#if></button>

</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <button  class="btn btn-primary" type="submit">Logout</button>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
</form>
</#macro>