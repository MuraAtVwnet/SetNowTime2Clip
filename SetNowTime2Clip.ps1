################################################
# 現在時刻をクリップボードにセットする
################################################
function now(){
    $NowDateTime = (Get-Date).ToString("yyyy年MM月dd日(ddd) HH:mm")
    echo $NowDateTime
    $NowDateTime | Set-Clipboard
}
