// weekNumberUtils.js
function selectNextWeek(monthIndex, mouse, click, delay, exists) {
    mouse().move("//kendo-combobox[@textfield='month_name']").click();
    click("//li[@index='" + monthIndex + "']");
    mouse().move("//kendo-combobox[@textfield='week_name']").click();
    delay(1000);
    if (exists("//li[contains(@class,'k-list-item k-disabled')]")) {
        monthIndex = monthIndex + 1;
        selectNextWeek(monthIndex, mouse, click, delay, exists);
    }
}
