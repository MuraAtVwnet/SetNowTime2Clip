■ これは何?
現在時刻をクリップボードにセットします。

PowerShell プロンプトで関数を Profile にセットするには以下を管理権限でコピペ

#---- ここから
$HereString = @'
################################################
# 現在時刻をクリップボードにセットする
################################################
function now(){
    $NowDateTime = (Get-Date).ToString("yyyy年MM月dd日(ddd) HH:mm")
    echo $NowDateTime
    $NowDateTime | Set-Clipboard
}
'@

# ヒア文字列を文字列配列にする
$Temp = $HereString.Replace("`r","")
$StringArray = $Temp.Split("`n")

# スクリプトの実行許可
if((Get-ExecutionPolicy) -ne "RemoteSigned"){Set-ExecutionPolicy RemoteSigned -Force}

# プロファイルの有無確認
if( -not (Test-Path $PROFILE)){
    # フォルダが無かったら作る
    if( -not (Test-Path (Split-Path $PROFILE -Parent))){md (Split-Path $PROFILE -Parent)}
}

# プロファイルに関数追加
Add-Content -Value $StringArray -Path $PROFILE -Encoding UTF8
#---- ここまで


■ Web サイト
現在時刻をクリップボードにセットする
http://www.vwnet.jp/Windows/PowerShell/2019060201/NowTime2Clip.htm
