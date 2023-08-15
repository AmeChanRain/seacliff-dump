#!/system/bin/sh
PON_REASON=`cat sys/devices/platform/soc/c440000.qcom,spmi/spmi-0/spmi0-00/c440000.qcom,spmi:qcom,pm8150@0:qcom,power-on@800/power_on_reason`;
/system/bin/bootstat --set_system_power_on_reason "$PON_REASON";

POFF_REASON=`cat sys/devices/platform/soc/c440000.qcom,spmi/spmi-0/spmi0-00/c440000.qcom,spmi:qcom,pm8150@0:qcom,power-on@800/power_off_reason`;
/system/bin/bootstat --set_system_power_off_reason "$POFF_REASON";
