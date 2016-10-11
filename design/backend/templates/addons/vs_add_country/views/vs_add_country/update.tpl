{capture name="mainbox"}

    {capture name="tabsbox"}
        <form class="form-horizontal form-edit {$form_class}" action="{""|fn_url}" method="post" id="country_update_form" enctype="multipart/form-data"> 
        
            <input type="hidden" name="fake" value="1" />
            <input type="hidden" name="selected_section" id="selected_section" value="{$smarty.request.selected_section}" />

            <div id="content_general"> 
                <fieldset>
                        <div class="control-group">
                            <label for="elm_country_code" class="control-label cm-required">{__("country_code")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_code]" id="elm_country_code" size="32" /><small>{__("write_here_country_two_digit_code")}</small>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="elm_country_name" class="control-label cm-required">{__("country_name")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_name]" id="elm_country_name" size="32" /><small>{__("write_here_country_name")}</small>
                            </div>
                        </div>
                       
                        <div class="control-group">
                            <label for="elm_country_a3_code" class="control-label cm-required">{__("country_a3_code")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_a3_code]" id="elm_country_a3_code" size="32" /><small>{__("write_here_country_three_digit_code")}</small>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="elm_country_n3_code" class="control-label cm-required">{__("country_n3_code")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_n3_code]" id="elm_country_n3_code" size="32" /><small>{__("write_here_country_three_digit_numeric_code")}</small>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="elm_country_region" class="control-label cm-required cm-value-decimal">{__("country_region")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_region]" id="elm_country_region" size="32" /><small>{__("write_here_country_region_code")}</small>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="elm_country_latitute" class="control-label cm-required cm-value-decimal">{__("country_latitute")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_latitute]" id="elm_country_latitute" size="32" /><small>{__("write_here_country_latitute")}</small>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="elm_country_longitute" class="control-label cm-required">{__("country_longitute")}:</label>
                            <div class="controls">
                                <input type="text" name="country_data[country_longitute]" id="elm_country_longitute" size="32" /><small>{__("write_here_country_langitute")}</small>
                            </div>
                        </div>

                        {include file="common/select_status.tpl" input_name="country_data[status]" id="elm_country_data_status" obj_id=$id obj=$country_data hidden=false}
                        <hr>
                        <div>
                            <p>{__('note')}:- {__("Please_fill_accurate_info_because_wrong_data_can_affect_your_store_functionality")}</p>
                        </div>
                </fieldset>
            </div> 

        </form> 
    {/capture}
    {include file="common/tabsbox.tpl" content=$smarty.capture.tabsbox group_name="countries" active_tab=$smarty.request.selected_section track=true}

{/capture}

{** Form submit section **}
{capture name="buttons"}
    {include file="buttons/save_cancel.tpl" but_name="dispatch[vs_add_country.update]" but_target_form="country_update_form" hide_second_button=true}
{/capture}
{** /Form submit section **}


    {$_title=__("add_country")}

{include file="common/mainbox.tpl" title=$_title content=$smarty.capture.mainbox select_languages=true buttons=$smarty.capture.buttons}