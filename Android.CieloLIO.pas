
unit Android.CieloLIO;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.JavaUtil,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  JIRemoteOrderService = interface;//cielo.orders.aidl.IRemoteOrderService
  JIRemoteOrderService_Stub = interface;//cielo.orders.aidl.IRemoteOrderService$Stub
  JIRemoteOrderService_Stub_Proxy = interface;//cielo.orders.aidl.IRemoteOrderService$Stub$Proxy
  JParcelableItem = interface;//cielo.orders.aidl.ParcelableItem
  JParcelableItem_Companion = interface;//cielo.orders.aidl.ParcelableItem$Companion
  JParcelableItem_Companion_CREATOR_1 = interface;//cielo.orders.aidl.ParcelableItem$Companion$CREATOR$1
  JParcelableOrder = interface;//cielo.orders.aidl.ParcelableOrder
  JParcelableOrder_Companion = interface;//cielo.orders.aidl.ParcelableOrder$Companion
  JParcelableOrder_Companion_CREATOR_1 = interface;//cielo.orders.aidl.ParcelableOrder$Companion$CREATOR$1
  JParcelableResultOrders = interface;//cielo.orders.aidl.ParcelableResultOrders
  JParcelableResultOrders_Companion = interface;//cielo.orders.aidl.ParcelableResultOrders$Companion
  JCREATOR_1 = interface;//cielo.orders.aidl.ParcelableResultOrders$Companion$CREATOR$1
  JParcelableTransaction = interface;//cielo.orders.aidl.ParcelableTransaction
  JParcelableTransaction_Companion = interface;//cielo.orders.aidl.ParcelableTransaction$Companion
  JCompanion_CREATOR_1 = interface;//cielo.orders.aidl.ParcelableTransaction$Companion$CREATOR$1
  Jdomain_Credentials = interface;//cielo.orders.domain.Credentials
  JDeviceModel = interface;//cielo.orders.domain.DeviceModel
  Jdomain_Item = interface;//cielo.orders.domain.Item
  JLauncherVersionCode = interface;//cielo.orders.domain.LauncherVersionCode
  JLauncherVersionCode_Companion = interface;//cielo.orders.domain.LauncherVersionCode$Companion
  JOrder = interface;//cielo.orders.domain.Order
  JOrderType = interface;//cielo.orders.domain.OrderType
  JOrderType_Companion = interface;//cielo.orders.domain.OrderType$Companion
  JPrinterAttributes = interface;//cielo.orders.domain.PrinterAttributes
  JPrinterAttributes_Companion = interface;//cielo.orders.domain.PrinterAttributes$Companion
  JPurchase = interface;//cielo.orders.domain.Purchase
  JResultOrders = interface;//cielo.orders.domain.ResultOrders
  Jdomain_Settings = interface;//cielo.orders.domain.Settings
  JSettings_Companion = interface;//cielo.orders.domain.Settings$Companion
  Jdomain_Status = interface;//cielo.orders.domain.Status
  JV40Code = interface;//cielo.orders.domain.V40Code
  JV40Code_Companion = interface;//cielo.orders.domain.V40Code$Companion
  JPrimaryProductExtensionKt = interface;//cielo.orders.domain.extension.PrimaryProductExtensionKt
  JSettingsExtensionKt = interface;//cielo.orders.domain.extension.SettingsExtensionKt
  JPrimaryProduct = interface;//cielo.orders.domain.product.PrimaryProduct
  JProductsColumnsNames = interface;//cielo.orders.domain.product.ProductsColumnsNames
  JProductsColumnsNames_Companion = interface;//cielo.orders.domain.product.ProductsColumnsNames$Companion
  JSecondaryProduct = interface;//cielo.orders.domain.product.SecondaryProduct
  JInfoManager = interface;//cielo.sdk.info.InfoManager
  JBaseOrderManager = interface;//cielo.sdk.order.BaseOrderManager
  JBaseOrderManager_DefaultImpls = interface;//cielo.sdk.order.BaseOrderManager$DefaultImpls
  JOrderManager = interface;//cielo.sdk.order.OrderManager
  JOrderManager_Companion = interface;//cielo.sdk.order.OrderManager$Companion
  JPrinterListener = interface;//cielo.sdk.order.PrinterListener
  JPurchaseValidationListener = interface;//cielo.sdk.order.PurchaseValidationListener
  JServiceBindListener = interface;//cielo.sdk.order.ServiceBindListener
  JCanceledPayment = interface;//cielo.sdk.order.cancellation.CanceledPayment
  //Jtype_1 = interface;//cielo.sdk.order.cancellation.CanceledPayment$type$1
  JCancellationListener = interface;//cielo.sdk.order.cancellation.CancellationListener
  JPayment = interface;//cielo.sdk.order.payment.Payment
  //JPayment_type_1 = interface;//cielo.sdk.order.payment.Payment$type$1
  JPaymentCode = interface;//cielo.sdk.order.payment.PaymentCode
  JPaymentError = interface;//cielo.sdk.order.payment.PaymentError
  JPaymentListener = interface;//cielo.sdk.order.payment.PaymentListener
  JPaymentMethod = interface;//cielo.sdk.order.payment.PaymentMethod
  JExtensionsKt = interface;//cielo.sdk.order.utils.ExtensionsKt
  JSdkUtilsKt = interface;//cielo.sdk.order.utils.SdkUtilsKt
  JSdkUtilsKt_WhenMappings = interface;//cielo.sdk.order.utils.SdkUtilsKt$WhenMappings
  Jutils_SecureRandom = interface;//cielo.sdk.order.utils.SecureRandom
  JOrderManagerImplv1 = interface;//cielo.sdk.order.v1.OrderManagerImplv1
  JOrderManagerImplv1_CancellationBroadcastReceiver = interface;//cielo.sdk.order.v1.OrderManagerImplv1$CancellationBroadcastReceiver
  JOrderManagerImplv1_PaymentBroadcastReceiver = interface;//cielo.sdk.order.v1.OrderManagerImplv1$PaymentBroadcastReceiver
  //Jbind_1 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$bind$1
  //Jbind_2 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$bind$2
  JsortedByDescending_1 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$orderTransactionsByRequestDate$$inlined$sortedByDescending$1
  JserviceConnection_1 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$serviceConnection$1
  //JvalidateCredentials_1 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$validateCredentials$1
  //JvalidateCredentials_2 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$validateCredentials$2
  //JokHttpClient_1 = interface;//cielo.sdk.order.v1.OrderManagerImplv1$validateCredentials$okHttpClient$1
  JOrderManagerImplv2 = interface;//cielo.sdk.order.v2.OrderManagerImplv2
  JOrderManagerImplv3 = interface;//cielo.sdk.order.v3.OrderManagerImplv3
  JOrderManagerImplv4 = interface;//cielo.sdk.order.v4.OrderManagerImplv4
  JOrderManagerImplv5 = interface;//cielo.sdk.order.v5.OrderManagerImplv5
  JOrderManagerImplv6 = interface;//cielo.sdk.order.v5.OrderManagerImplv6
  JOrderManagerImplv7 = interface;//cielo.sdk.order.v7.OrderManagerImplv7
  Jordermanager_BuildConfig = interface;//cielo.sdk.ordermanager.BuildConfig
  JPrinterManager = interface;//cielo.sdk.printer.PrinterManager
  //JconfigPrinterListener_1 = interface;//cielo.sdk.printer.PrinterManager$configPrinterListener$1
  JAccessTokenManagementApi = interface;//cielo.sdk.repository.remote.retrofit.AccessTokenManagementApi
  JPurchaseApi = interface;//cielo.sdk.repository.remote.retrofit.PurchaseApi
  Jentity_ApplicationInfo = interface;//cielo.sdk.repository.remote.retrofit.entity.ApplicationInfo
  JAbstractStringBuilder = interface;//java.lang.AbstractStringBuilder
  JStringBuffer = interface;//java.lang.StringBuffer
  JStringBuilder = interface;//java.lang.StringBuilder

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;
    {class} procedure addListener(listener: JAnimator_AnimatorListener); cdecl;//Deprecated
    {class} procedure &end; cdecl;
    {class} function getDuration: Int64; cdecl;
    {class} function isPaused: Boolean; cdecl;
    {class} function isRunning: Boolean; cdecl;
    {class} function isStarted: Boolean; cdecl;
    {class} procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    {class} procedure resume; cdecl;
    {class} function setDuration(duration: Int64): JAnimator; cdecl;
    {class} procedure setupEndValues; cdecl;
    {class} procedure setupStartValues; cdecl;
    {class} procedure start; cdecl;
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure cancel; cdecl;
    function clone: JAnimator; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;
    function getListeners: JArrayList; cdecl;
    function getStartDelay: Int64; cdecl;
    procedure pause; cdecl;
    procedure removeAllListeners; cdecl;
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure setInterpolator(value: JTimeInterpolator); cdecl;
    procedure setStartDelay(startDelay: Int64); cdecl;
    procedure setTarget(target: JObject); cdecl;
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    {class} procedure onAnimationResume(animation: JAnimator); cdecl;
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationPause(animation: JAnimator); cdecl;
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    {class} function getType: Jlang_Class; cdecl;//Deprecated
    {class} function getValue: JObject; cdecl;//Deprecated
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;
    {class} procedure setValue(value: JObject); cdecl;
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function clone: JKeyframe; cdecl;//Deprecated
    function getFraction: Single; cdecl;//Deprecated
    function hasValue: Boolean; cdecl;
    procedure setFraction(fraction: Single); cdecl;
    procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;
    {class} procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    {class} procedure disableTransitionType(transitionType: Integer); cdecl;//Deprecated
    {class} procedure enableTransitionType(transitionType: Integer); cdecl;//Deprecated
    {class} function getStagger(transitionType: Integer): Int64; cdecl;//Deprecated
    {class} function getStartDelay(transitionType: Integer): Int64; cdecl;//Deprecated
    {class} function getTransitionListeners: JList; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;//Deprecated
    {class} procedure removeChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    {class} procedure setDuration(duration: Int64); cdecl; overload;
    {class} procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;
    {class} procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;
    {class} procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    function getAnimator(transitionType: Integer): JAnimator; cdecl;//Deprecated
    function getDuration(transitionType: Integer): Int64; cdecl;//Deprecated
    function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;//Deprecated
    function isChangingLayout: Boolean; cdecl;//Deprecated
    procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;
    procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;
    procedure setStagger(transitionType: Integer; duration: Int64); cdecl;
    procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
    {class} procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function clone: JPropertyValuesHolder; cdecl;
    {class} function getPropertyName: JString; cdecl;
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    procedure setConverter(converter: JTypeConverter); cdecl;//Deprecated
    procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;//Deprecated
    procedure setProperty(property_: JProperty); cdecl;
    procedure setPropertyName(propertyName: JString); cdecl;
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;
    {class} procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;//Deprecated
    {class} function clone: JStateListAnimator; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure jumpToCurrentState; cdecl;//Deprecated
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
    {class} function getInterpolation(input: Single): Single; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
    function convert(value: JObject): JObject; cdecl;
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
    {class} function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;
    {class} procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    {class} procedure cancel; cdecl;
    {class} function clone: JValueAnimator; cdecl;
    {class} function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;
    {class} function getCurrentPlayTime: Int64; cdecl;
    {class} function getDuration: Int64; cdecl;
    {class} function getFrameDelay: Int64; cdecl;
    {class} function getRepeatMode: Integer; cdecl;
    {class} function getStartDelay: Int64; cdecl;
    {class} function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;
    {class} procedure removeAllUpdateListeners; cdecl;//Deprecated
    {class} procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    {class} procedure resume; cdecl;//Deprecated
    {class} function setDuration(duration: Int64): JValueAnimator; cdecl;//Deprecated
    {class} procedure setEvaluator(value: JTypeEvaluator); cdecl;//Deprecated
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;//Deprecated
    {class} procedure setRepeatCount(value: Integer); cdecl;//Deprecated
    {class} procedure setRepeatMode(value: Integer); cdecl;//Deprecated
    {class} function toString: JString; cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure &end; cdecl;
    function getAnimatedFraction: Single; cdecl;
    function getAnimatedValue: JObject; cdecl; overload;
    function getInterpolator: JTimeInterpolator; cdecl;
    function getRepeatCount: Integer; cdecl;
    function isRunning: Boolean; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    procedure pause; cdecl;//Deprecated
    procedure reverse; cdecl;//Deprecated
    procedure setCurrentFraction(fraction: Single); cdecl;//Deprecated
    procedure setCurrentPlayTime(playTime: Int64); cdecl;//Deprecated
    procedure setInterpolator(value: JTimeInterpolator); cdecl;//Deprecated
    procedure setStartDelay(startDelay: Int64); cdecl;
    procedure start; cdecl;
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
    procedure onAnimationUpdate(animation: JValueAnimator); cdecl;//Deprecated
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;
    {class} function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} procedure enter; cdecl;//Deprecated
    {class} procedure exit; cdecl;//Deprecated
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;//Deprecated
    {class} procedure setExitAction(action: JRunnable); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    function getSceneRoot: JViewGroup; cdecl;//Deprecated
    procedure setEnterAction(action: JRunnable); cdecl;//Deprecated
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;
    {class} function addTarget(targetName: JString): JTransition; cdecl; overload;
    {class} function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;
    {class} function addTarget(target: JView): JTransition; cdecl; overload;
    {class} function clone: JTransition; cdecl;
    {class} function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;
    {class} function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;
    {class} function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;
    {class} function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;
    {class} function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function getName: JString; cdecl;
    {class} function getTargetIds: JList; cdecl;//Deprecated
    {class} function getTargetNames: JList; cdecl;//Deprecated
    {class} function getTargetTypes: JList; cdecl;//Deprecated
    {class} function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;//Deprecated
    {class} function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;//Deprecated
    {class} function removeTarget(targetId: Integer): JTransition; cdecl; overload;//Deprecated
    {class} function setDuration(duration: Int64): JTransition; cdecl;//Deprecated
    {class} procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;//Deprecated
    {class} function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;//Deprecated
    {class} function setStartDelay(startDelay: Int64): JTransition; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    function addTarget(targetId: Integer): JTransition; cdecl; overload;
    function canRemoveViews: Boolean; cdecl;
    procedure captureEndValues(transitionValues: JTransitionValues); cdecl;
    procedure captureStartValues(transitionValues: JTransitionValues); cdecl;
    function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;
    function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;
    function getDuration: Int64; cdecl;
    function getEpicenter: JRect; cdecl;
    function getPathMotion: JPathMotion; cdecl;//Deprecated
    function getPropagation: JTransitionPropagation; cdecl;//Deprecated
    function getStartDelay: Int64; cdecl;//Deprecated
    function getTargets: JList; cdecl;//Deprecated
    function getTransitionProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
    function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;//Deprecated
    function removeTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    function removeTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    procedure setPathMotion(pathMotion: JPathMotion); cdecl;//Deprecated
    procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;//Deprecated
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;
    {class} function onGetEpicenter(transition: JTransition): JRect; cdecl;
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionCancel(transition: JTransition); cdecl;
    {class} procedure onTransitionStart(transition: JTransition); cdecl;
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionEnd(transition: JTransition); cdecl;
    procedure onTransitionPause(transition: JTransition); cdecl;
    procedure onTransitionResume(transition: JTransition); cdecl;
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;//Deprecated
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;//Deprecated
    {class} procedure go(scene: JScene); cdecl; overload;//Deprecated
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    procedure transitionTo(scene: JScene); cdecl;//Deprecated
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;
    {class} procedure captureValues(transitionValues: JTransitionValues); cdecl;
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    function getPropagationProperties: TJavaObjectArray<JString>; cdecl;
    function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function init: JTransitionValues; cdecl;
    {class} function equals(other: JObject): Boolean; cdecl;
    {class} function hashCode: Integer; cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function _Getvalues: JMap; cdecl;
    function _Getview: JView; cdecl;
    property values: JMap read _Getvalues;
    property view: JView read _Getview;
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  JIRemoteOrderServiceClass = interface(JIInterfaceClass)
    ['{1B74BCF1-70BE-4AD3-BBE3-1292922504F1}']
  end;

  [JavaSignature('cielo/orders/aidl/IRemoteOrderService')]
  JIRemoteOrderService = interface(JIInterface)
    ['{F1285EE3-8A31-4634-AEE1-BCB4072243F3}']
    function createDraftOrder(P1: JString): JParcelableOrder; cdecl;//Deprecated
    function findOrder(P1: Int64; P2: JString; P3: JString): JParcelableOrder; cdecl;//Deprecated
    function findPaymentTransaction(P1: Int64; P2: JString; P3: JString): JParcelableTransaction; cdecl;//Deprecated
    function findPromoTransactionInRange(P1: Int64; P2: Int64): JList; cdecl;//Deprecated
    function retrieveOrders(P1: Integer; P2: Integer; P3: JString; P4: JString): JParcelableResultOrders; cdecl;//Deprecated
    function saveCancellation(P1: JParcelableTransaction; P2: JParcelableTransaction; P3: JString): Boolean; cdecl;//Deprecated
    function saveTransaction(P1: JParcelableTransaction; P2: JString): Boolean; cdecl;//Deprecated
    function update(P1: JParcelableOrder): Boolean; cdecl;//Deprecated
  end;
  TJIRemoteOrderService = class(TJavaGenericImport<JIRemoteOrderServiceClass, JIRemoteOrderService>) end;

  JIRemoteOrderService_StubClass = interface(JBinderClass)
    ['{13E7F449-2678-48F5-8799-AC06449A168C}']
    {class} function asInterface(P1: JIBinder): JIRemoteOrderService; cdecl;
    {class} function init: JIRemoteOrderService_Stub; cdecl;
  end;

  [JavaSignature('cielo/orders/aidl/IRemoteOrderService$Stub')]
  JIRemoteOrderService_Stub = interface(JBinder)
    ['{4D5C601C-3445-4C9C-BBC7-C01B174ACD39}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJIRemoteOrderService_Stub = class(TJavaGenericImport<JIRemoteOrderService_StubClass, JIRemoteOrderService_Stub>) end;

  JIRemoteOrderService_Stub_ProxyClass = interface(JIRemoteOrderServiceClass)
    ['{E362A2DD-C255-407D-A101-B0029F5A5CB5}']
  end;

  [JavaSignature('cielo/orders/aidl/IRemoteOrderService$Stub$Proxy')]
  JIRemoteOrderService_Stub_Proxy = interface(JIRemoteOrderService)
    ['{7F5106B7-18DE-4F87-BB3C-24392ED799D2}']
    function asBinder: JIBinder; cdecl;//Deprecated
    function createDraftOrder(P1: JString): JParcelableOrder; cdecl;//Deprecated
    function findOrder(P1: Int64; P2: JString; P3: JString): JParcelableOrder; cdecl;//Deprecated
    function findPaymentTransaction(P1: Int64; P2: JString; P3: JString): JParcelableTransaction; cdecl;//Deprecated
    function findPromoTransactionInRange(P1: Int64; P2: Int64): JList; cdecl;//Deprecated
    function getInterfaceDescriptor: JString; cdecl;//Deprecated
    function retrieveOrders(P1: Integer; P2: Integer; P3: JString; P4: JString): JParcelableResultOrders; cdecl;//Deprecated
    function saveCancellation(P1: JParcelableTransaction; P2: JParcelableTransaction; P3: JString): Boolean; cdecl;//Deprecated
    function saveTransaction(P1: JParcelableTransaction; P2: JString): Boolean; cdecl;//Deprecated
    function update(P1: JParcelableOrder): Boolean; cdecl;//Deprecated
  end;
  TJIRemoteOrderService_Stub_Proxy = class(TJavaGenericImport<JIRemoteOrderService_Stub_ProxyClass, JIRemoteOrderService_Stub_Proxy>) end;

  JParcelableItemClass = interface(JParcelableClass)
    ['{F5DFE357-68CE-47A7-A853-EE425660C2C4}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetCompanion: JParcelableItem_Companion; cdecl;
    {class} function init: JParcelableItem; cdecl; overload;
    {class} function init(P1: JParcel): JParcelableItem; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: Int64; P6: Int64; P7: Integer; P8: JString; P9: JString; P10: JString): JParcelableItem; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property Companion: JParcelableItem_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableItem')]
  JParcelableItem = interface(JParcelable)
    ['{A9932E87-42EB-476D-8230-CFE1FCD0B014}']
    function describeContents: Integer; cdecl;
    function getAmount: Int64; cdecl;
    function getDescription: JString; cdecl;
    function getDetails: JString; cdecl;
    function getId: JString; cdecl;
    function getName: JString; cdecl;
    function getQuantity: Integer; cdecl;
    function getReference: JString; cdecl;
    function getSku: JString; cdecl;
    function getUnitOfMeasure: JString; cdecl;
    function getUnitPrice: Int64; cdecl;
    procedure setAmount(P1: Int64); cdecl;
    procedure setDescription(P1: JString); cdecl;
    procedure setDetails(P1: JString); cdecl;
    procedure setId(P1: JString); cdecl;
    procedure setName(P1: JString); cdecl;
    procedure setQuantity(P1: Integer); cdecl;
    procedure setReference(P1: JString); cdecl;
    procedure setSku(P1: JString); cdecl;
    procedure setUnitOfMeasure(P1: JString); cdecl;
    procedure setUnitPrice(P1: Int64); cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
  end;
  TJParcelableItem = class(TJavaGenericImport<JParcelableItemClass, JParcelableItem>) end;

  JParcelableItem_CompanionClass = interface(JObjectClass)
    ['{96AE2FB2-D9CA-4F16-81C3-82648270BAE8}']
    {class} //function init(P1: JDefaultConstructorMarker): JParcelableItem_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableItem$Companion')]
  JParcelableItem_Companion = interface(JObject)
    ['{619D396C-09BF-46A7-91FA-32D0AFF4A96C}']
  end;
  TJParcelableItem_Companion = class(TJavaGenericImport<JParcelableItem_CompanionClass, JParcelableItem_Companion>) end;

  JParcelableItem_Companion_CREATOR_1Class = interface(JParcelable_CreatorClass)
    ['{AFC4AEFD-E072-4A7B-B71A-5505F9DB573F}']
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableItem$Companion$CREATOR$1')]
  JParcelableItem_Companion_CREATOR_1 = interface(JParcelable_Creator)
    ['{B6FD74E8-9233-4D89-9C3A-18BE51C2D78E}']
    function createFromParcel(P1: JParcel): JParcelableItem; cdecl;//Deprecated
    function newArray(P1: Integer): TJavaObjectArray<JParcelableItem>; cdecl;//Deprecated
  end;
  TJParcelableItem_Companion_CREATOR_1 = class(TJavaGenericImport<JParcelableItem_Companion_CREATOR_1Class, JParcelableItem_Companion_CREATOR_1>) end;

  JParcelableOrderClass = interface(JParcelableClass)
    ['{9E9A3231-DFA6-4E8B-AE21-CFA60B9A283F}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetCompanion: JParcelableOrder_Companion; cdecl;
    {class} function init(P1: JParcel): JParcelableOrder; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JString; P4: Jdomain_Status; P5: JString; P6: JString; P7: JDate; P8: JDate; P9: JDate; P10: JList; P11: JString; P12: JList; P13: Int64; P14: Int64; P15: Int64; P16: JOrderType): JParcelableOrder; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property Companion: JParcelableOrder_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableOrder')]
  JParcelableOrder = interface(JParcelable)
    ['{2034E16A-3AEC-4ADB-80ED-72611E05BD42}']
    function _Getid: JString; cdecl;
    procedure _Setid(Value: JString); cdecl;
    function _Getitems: JList; cdecl;
    function _Getnotes: JString; cdecl;
    function _Getnumber: JString; cdecl;
    function _Getreference: JString; cdecl;
    function _Getstatus: Jdomain_Status; cdecl;
    function _Gettransactions: JList; cdecl;
    function describeContents: Integer; cdecl;
    function getAccessKey: JString; cdecl;
    function getAmount: Int64; cdecl;
    function getCreatedAt: JDate; cdecl;
    function getId: JString; cdecl;
    function getItems: JList; cdecl;
    function getLastModificationDate: JDate; cdecl;
    function getNotes: JString; cdecl;
    function getNumber: JString; cdecl;
    function getPaidAmount: Int64; cdecl;
    function getPendingAmount: Int64; cdecl;
    function getReference: JString; cdecl;
    function getReleaseDate: JDate; cdecl;
    function getSecretAccessKey: JString; cdecl;
    function getStatus: Jdomain_Status; cdecl;
    function getTransactions: JList; cdecl;
    function getType: JOrderType; cdecl;
    procedure setAccessKey(P1: JString); cdecl;
    procedure setAmount(P1: Int64); cdecl;
    procedure setCreatedAt(P1: JDate); cdecl;
    procedure setId(P1: JString); cdecl;
    procedure setItems(P1: JList); cdecl;
    procedure setLastModificationDate(P1: JDate); cdecl;
    procedure setNotes(P1: JString); cdecl;
    procedure setNumber(P1: JString); cdecl;
    procedure setPaidAmount(P1: Int64); cdecl;
    procedure setPendingAmount(P1: Int64); cdecl;
    procedure setReference(P1: JString); cdecl;
    procedure setReleaseDate(P1: JDate); cdecl;
    procedure setSecretAccessKey(P1: JString); cdecl;
    procedure setStatus(P1: Jdomain_Status); cdecl;
    procedure setTransactions(P1: JList); cdecl;
    procedure setType(P1: JOrderType); cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    property id: JString read _Getid write _Setid;
    property items: JList read _Getitems;
    property notes: JString read _Getnotes;
    property number: JString read _Getnumber;
    property reference: JString read _Getreference;
    property status: Jdomain_Status read _Getstatus;
    property transactions: JList read _Gettransactions;
  end;
  TJParcelableOrder = class(TJavaGenericImport<JParcelableOrderClass, JParcelableOrder>) end;

  JParcelableOrder_CompanionClass = interface(JObjectClass)
    ['{7130F433-E2EB-4ACE-8FF0-87C111B2319E}']
    {class} //function init(P1: JDefaultConstructorMarker): JParcelableOrder_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableOrder$Companion')]
  JParcelableOrder_Companion = interface(JObject)
    ['{A248B811-1C28-416C-8DE0-833336E477E1}']
  end;
  TJParcelableOrder_Companion = class(TJavaGenericImport<JParcelableOrder_CompanionClass, JParcelableOrder_Companion>) end;

  JParcelableOrder_Companion_CREATOR_1Class = interface(JParcelable_CreatorClass)
    ['{7EC00A8C-8FA4-431A-8C33-BB71ED1D38F8}']
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableOrder$Companion$CREATOR$1')]
  JParcelableOrder_Companion_CREATOR_1 = interface(JParcelable_Creator)
    ['{6155495A-9192-44FB-AF5C-607C93A9E8FC}']
    function createFromParcel(P1: JParcel): JParcelableOrder; cdecl;//Deprecated
    function newArray(P1: Integer): TJavaObjectArray<JParcelableOrder>; cdecl;//Deprecated
  end;
  TJParcelableOrder_Companion_CREATOR_1 = class(TJavaGenericImport<JParcelableOrder_Companion_CREATOR_1Class, JParcelableOrder_Companion_CREATOR_1>) end;

  JParcelableResultOrdersClass = interface(JParcelableClass)
    ['{1496B188-8757-447E-B969-F2FA701C9524}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetCompanion: JParcelableResultOrders_Companion; cdecl;
    {class} function init(P1: JParcel): JParcelableResultOrders; cdecl; overload;
    {class} function init(P1: JList; P2: Integer; P3: Integer; P4: Integer): JParcelableResultOrders; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property Companion: JParcelableResultOrders_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableResultOrders')]
  JParcelableResultOrders = interface(JParcelable)
    ['{9FFF331A-4E86-4DB8-8658-490B37579748}']
    function _Getresults: JList; cdecl;
    procedure _Setresults(Value: JList); cdecl;
    function describeContents: Integer; cdecl;
    function getCurrentPage: Integer; cdecl;
    function getResults: JList; cdecl;
    function getTotalItems: Integer; cdecl;
    function getTotalPages: Integer; cdecl;
    procedure setCurrentPage(P1: Integer); cdecl;
    procedure setResults(P1: JList); cdecl;
    procedure setTotalItems(P1: Integer); cdecl;
    procedure setTotalPages(P1: Integer); cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    property results: JList read _Getresults write _Setresults;
  end;
  TJParcelableResultOrders = class(TJavaGenericImport<JParcelableResultOrdersClass, JParcelableResultOrders>) end;

  JParcelableResultOrders_CompanionClass = interface(JObjectClass)
    ['{F058DEDF-A478-4D33-B145-EEEA23F09270}']
    {class} //function init(P1: JDefaultConstructorMarker): JParcelableResultOrders_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableResultOrders$Companion')]
  JParcelableResultOrders_Companion = interface(JObject)
    ['{1E5EE404-DA48-47DF-9886-69D34B8A2410}']
  end;
  TJParcelableResultOrders_Companion = class(TJavaGenericImport<JParcelableResultOrders_CompanionClass, JParcelableResultOrders_Companion>) end;

  JCREATOR_1Class = interface(JParcelable_CreatorClass)
    ['{1722BDDD-9502-4B11-867E-005823799B5F}']
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableResultOrders$Companion$CREATOR$1')]
  JCREATOR_1 = interface(JParcelable_Creator)
    ['{2F3A438C-F96D-4E34-A44B-4851323FAB61}']
    function createFromParcel(P1: JParcel): JParcelableResultOrders; cdecl;//Deprecated
    function newArray(P1: Integer): TJavaObjectArray<JParcelableResultOrders>; cdecl;//Deprecated
  end;
  TJCREATOR_1 = class(TJavaGenericImport<JCREATOR_1Class, JCREATOR_1>) end;

  JParcelableTransactionClass = interface(JParcelableClass)
    ['{9F05B9A6-7367-4199-ADD8-99B3F1030F0A}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetCompanion: JParcelableTransaction_Companion; cdecl;
    {class} function init(P1: JParcel): JParcelableTransaction; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: Int64; P10: JString; P11: Int64; P12: JString): JParcelableTransaction; cdecl; overload;
    {class} //function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: Int64; P10: JString; P11: Int64; P12: JString; P13: Integer; P14: JDefaultConstructorMarker): JParcelableTransaction; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property Companion: JParcelableTransaction_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableTransaction')]
  JParcelableTransaction = interface(JParcelable)
    ['{CADB7FB2-D0CF-4613-9A25-0312FBAEF873}']
    function describeContents: Integer; cdecl;
    function getAccessKey: JString; cdecl;
    function getAmount: Int64; cdecl;
    function getAuthCode: JString; cdecl;
    function getBrand: JString; cdecl;
    function getCieloCode: JString; cdecl;
    function getDescription: JString; cdecl;
    function getDiscountedAmount: Int64; cdecl;
    function getExternalId: JString; cdecl;
    function getId: JString; cdecl;
    function getMask: JString; cdecl;
    function getPaymentFields: JString; cdecl;
    function getTerminal: JString; cdecl;
    procedure setAccessKey(P1: JString); cdecl;
    procedure setAmount(P1: Int64); cdecl;
    procedure setDiscountedAmount(P1: Int64); cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
  end;
  TJParcelableTransaction = class(TJavaGenericImport<JParcelableTransactionClass, JParcelableTransaction>) end;

  JParcelableTransaction_CompanionClass = interface(JObjectClass)
    ['{0B90E00D-5CCD-4DB9-AA0B-E48D8D7618EA}']
    {class} //function init(P1: JDefaultConstructorMarker): JParcelableTransaction_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableTransaction$Companion')]
  JParcelableTransaction_Companion = interface(JObject)
    ['{490AC718-58B4-46FF-A8EC-D1C956DDAEBD}']
  end;
  TJParcelableTransaction_Companion = class(TJavaGenericImport<JParcelableTransaction_CompanionClass, JParcelableTransaction_Companion>) end;

  JCompanion_CREATOR_1Class = interface(JParcelable_CreatorClass)
    ['{9ADF9310-C220-4D5E-8CBF-F7CD809B378C}']
  end;

  [JavaSignature('cielo/orders/aidl/ParcelableTransaction$Companion$CREATOR$1')]
  JCompanion_CREATOR_1 = interface(JParcelable_Creator)
    ['{02C50E9E-4C2C-4794-AC42-24A600A3A572}']
    function createFromParcel(P1: JParcel): JParcelableTransaction; cdecl;//Deprecated
    function newArray(P1: Integer): TJavaObjectArray<JParcelableTransaction>; cdecl;//Deprecated
  end;
  TJCompanion_CREATOR_1 = class(TJavaGenericImport<JCompanion_CREATOR_1Class, JCompanion_CREATOR_1>) end;

  Jdomain_CredentialsClass = interface(JObjectClass)
    ['{FB134B1A-DE68-484D-8B5F-FE040C5907BF}']
    {class} function init(P1: JString; P2: JString): Jdomain_Credentials; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/Credentials')]
  Jdomain_Credentials = interface(JObject)
    ['{204E26EF-9E49-4F6F-A2D3-26EDE6DA56B2}']
    function component1: JString; cdecl;//Deprecated
    function component2: JString; cdecl;//Deprecated
    function copy(P1: JString; P2: JString): Jdomain_Credentials; cdecl;//Deprecated
    function equals(P1: JObject): Boolean; cdecl;//Deprecated
    function getAccessToken: JString; cdecl;//Deprecated
    function getClientID: JString; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJdomain_Credentials = class(TJavaGenericImport<Jdomain_CredentialsClass, Jdomain_Credentials>) end;

  JDeviceModelClass = interface(JEnumClass)
    ['{8E4EFDA9-C7F2-4A2A-996F-7771844646E2}']
    {class} function _GetLIO_V1: JDeviceModel; cdecl;
    {class} function _GetLIO_V2: JDeviceModel; cdecl;
    {class} function valueOf(P1: JString): JDeviceModel; cdecl;
    {class} function values: TJavaObjectArray<JDeviceModel>; cdecl;
    {class} property LIO_V1: JDeviceModel read _GetLIO_V1;
    {class} property LIO_V2: JDeviceModel read _GetLIO_V2;
  end;

  [JavaSignature('cielo/orders/domain/DeviceModel')]
  JDeviceModel = interface(JEnum)
    ['{AF33789E-2071-4B73-B059-5414CB479D2F}']
  end;
  TJDeviceModel = class(TJavaGenericImport<JDeviceModelClass, JDeviceModel>) end;

  Jdomain_ItemClass = interface(JSerializableClass)
    ['{2D8762F3-BD34-4076-9582-0DBE7A90A2E3}']
    {class} function init(P1: JString; P2: JString; P3: Int64; P4: Integer; P5: JString): Jdomain_Item; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/Item')]
  Jdomain_Item = interface(JSerializable)
    ['{07C81634-40AE-4196-9F0F-37525E4A3EFA}']
    procedure decreaseQuantity; cdecl; overload;//Deprecated
    procedure decreaseQuantity(P1: Integer); cdecl; overload;//Deprecated
    function getAmount: Int64; cdecl;//Deprecated
    function getDescription: JString; cdecl;//Deprecated
    function getDetails: JString; cdecl;//Deprecated
    function getId: JString; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
    function getQuantity: Integer; cdecl;//Deprecated
    function getReference: JString; cdecl;//Deprecated
    function getSku: JString; cdecl;//Deprecated
    function getUnitOfMeasure: JString; cdecl;//Deprecated
    function getUnitPrice: Int64; cdecl;//Deprecated
    procedure increaseQuantity; cdecl; overload;//Deprecated
    procedure increaseQuantity(P1: Integer); cdecl; overload;//Deprecated
    procedure setDescription(P1: JString); cdecl;//Deprecated
    procedure setDetails(P1: JString); cdecl;//Deprecated
    procedure setName(P1: JString); cdecl;//Deprecated
    procedure setQuantity(P1: Integer); cdecl;//Deprecated
    procedure setReference(P1: JString); cdecl;//Deprecated
    procedure setSku(P1: JString); cdecl;//Deprecated
    procedure setUnitOfMeasure(P1: JString); cdecl;//Deprecated
    procedure setUnitPrice(P1: Int64); cdecl;//Deprecated
  end;
  TJdomain_Item = class(TJavaGenericImport<Jdomain_ItemClass, Jdomain_Item>) end;

  JLauncherVersionCodeClass = interface(JObjectClass)
    ['{C639D8BB-1DB5-4151-98CB-FBF4707D222E}']
    {class} function _GetCompanion: JLauncherVersionCode_Companion; cdecl;
    {class} function getAccessKey: Integer; cdecl;
    {class} function getAccessKeyRelease: Integer; cdecl;
    {class} function getAuthorization: Integer; cdecl;
    {class} function getCheckoutWithEmail: Integer; cdecl;
    {class} function getCieloIntegration: Integer; cdecl;
    {class} function getGetOrdersRelease: Integer; cdecl;
    {class} function getMultiMerchantCode: Integer; cdecl;
    {class} function getNewPaymentTypesRelease: Integer; cdecl;
    {class} function getPaymentCodes: Integer; cdecl;
    {class} function getSdkRelease: Integer; cdecl;
    {class} function init: JLauncherVersionCode; cdecl;
    {class} property Companion: JLauncherVersionCode_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/domain/LauncherVersionCode')]
  JLauncherVersionCode = interface(JObject)
    ['{47BBC084-0410-4FA0-B492-2D8A3A2B8EDC}']
  end;
  TJLauncherVersionCode = class(TJavaGenericImport<JLauncherVersionCodeClass, JLauncherVersionCode>) end;

  JLauncherVersionCode_CompanionClass = interface(JObjectClass)
    ['{43709DA5-BFBA-46EF-AAFC-DCB741278913}']
    {class} //function init(P1: JDefaultConstructorMarker): JLauncherVersionCode_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/LauncherVersionCode$Companion')]
  JLauncherVersionCode_Companion = interface(JObject)
    ['{9215EA91-BFD0-45D0-8556-E79B3FC5BF82}']
    function getAccessKey: Integer; cdecl;//Deprecated
    function getAccessKeyRelease: Integer; cdecl;//Deprecated
    function getAuthorization: Integer; cdecl;//Deprecated
    function getCheckoutWithEmail: Integer; cdecl;//Deprecated
    function getCieloIntegration: Integer; cdecl;//Deprecated
    function getGetOrdersRelease: Integer; cdecl;//Deprecated
    function getMultiMerchantCode: Integer; cdecl;//Deprecated
    function getNewPaymentTypesRelease: Integer; cdecl;//Deprecated
    function getPaymentCodes: Integer; cdecl;//Deprecated
    function getSdkRelease: Integer; cdecl;//Deprecated
  end;
  TJLauncherVersionCode_Companion = class(TJavaGenericImport<JLauncherVersionCode_CompanionClass, JLauncherVersionCode_Companion>) end;

  JOrderClass = interface(JSerializableClass)
    ['{DA995EA1-676D-4494-B34D-DA6F8A731393}']
    {class} function init(P1: JParcelableOrder): JOrder; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/Order')]
  JOrder = interface(JSerializable)
    ['{610806BE-87CD-45A4-B447-E1CC3F5B3AEA}']
    function addItem(P1: JString; P2: JString; P3: Int64; P4: Integer; P5: JString): Jdomain_Item; cdecl;//Deprecated
    function cancel: Boolean; cdecl;//Deprecated
    function close: Boolean; cdecl;//Deprecated
    function decreaseQuantity(P1: JString): Jdomain_Item; cdecl;//Deprecated
    function getCreatedAt: JDate; cdecl;//Deprecated
    function getId: JString; cdecl;//Deprecated
    function getItems: JList; cdecl;//Deprecated
    function getNotes: JString; cdecl;//Deprecated
    function getNumber: JString; cdecl;//Deprecated
    function getPaidAmount: Int64; cdecl;//Deprecated
    function getPayments: JList; cdecl;//Deprecated
    function getPendingAmount: Int64; cdecl;//Deprecated
    function getPrice: Int64; cdecl;//Deprecated
    function getReference: JString; cdecl;//Deprecated
    function getReleaseDate: JDate; cdecl;//Deprecated
    function getStatus: Jdomain_Status; cdecl;//Deprecated
    function getType: JOrderType; cdecl;//Deprecated
    function getUpdatedAt: JDate; cdecl;//Deprecated
    function increaseQuantity(P1: JString): Jdomain_Item; cdecl;//Deprecated
    function markAsApproved: Boolean; cdecl;//Deprecated
    function markAsPaid: Boolean; cdecl;//Deprecated
    function markAsRejected: Boolean; cdecl;//Deprecated
    function paidAmount: Int64; cdecl;//Deprecated
    function pendingAmount: Int64; cdecl;//Deprecated
    function place: Boolean; cdecl;//Deprecated
    function reenter: Boolean; cdecl;//Deprecated
    function removeAllItems: Boolean; cdecl;//Deprecated
    function removeItem(P1: JString): Boolean; cdecl;//Deprecated
    procedure setNotes(P1: JString); cdecl;//Deprecated
    procedure setNumber(P1: JString); cdecl;//Deprecated
    procedure setReference(P1: JString); cdecl;//Deprecated
    procedure setUpdatedAt(P1: JDate); cdecl;//Deprecated
    procedure updateAmount; cdecl;//Deprecated
  end;
  TJOrder = class(TJavaGenericImport<JOrderClass, JOrder>) end;

  JOrderTypeClass = interface(JEnumClass)
    ['{6DC15739-0A2D-478E-B890-9471F3BBC860}']
    {class} function _GetAUTHORIZATION: JOrderType; cdecl;
    {class} function _GetCompanion: JOrderType_Companion; cdecl;
    {class} function _GetPAYMENT: JOrderType; cdecl;
    {class} function valueOf(P1: JString): JOrderType; cdecl;
    {class} function values: TJavaObjectArray<JOrderType>; cdecl;
    {class} property AUTHORIZATION: JOrderType read _GetAUTHORIZATION;
    {class} property Companion: JOrderType_Companion read _GetCompanion;
    {class} property PAYMENT: JOrderType read _GetPAYMENT;
  end;

  [JavaSignature('cielo/orders/domain/OrderType')]
  JOrderType = interface(JEnum)
    ['{63D511CF-20E8-4E4B-AD6D-7F467EF46884}']
    function identifier: JString; cdecl;
  end;
  TJOrderType = class(TJavaGenericImport<JOrderTypeClass, JOrderType>) end;

  JOrderType_CompanionClass = interface(JObjectClass)
    ['{692DAE63-8B34-4ED9-8FFE-94511EA7036D}']
    {class} //function init(P1: JDefaultConstructorMarker): JOrderType_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/OrderType$Companion')]
  JOrderType_Companion = interface(JObject)
    ['{819F322B-1863-4BB9-B3AE-CA6851E192E5}']
    function from(P1: JString): JOrderType; cdecl;//Deprecated
  end;
  TJOrderType_Companion = class(TJavaGenericImport<JOrderType_CompanionClass, JOrderType_Companion>) end;

  JPrinterAttributesClass = interface(JObjectClass)
    ['{4BD8E80D-373C-4F0E-B72F-E02B79F2F2A6}']
    {class} function _GetCompanion: JPrinterAttributes_Companion; cdecl;
    {class} function _GetKEY_ALIGN: JString; cdecl;
    {class} function _GetKEY_LINE_SPACE: JString; cdecl;
    {class} function _GetKEY_MARGIN_BOTTOM: JString; cdecl;
    {class} function _GetKEY_MARGIN_LEFT: JString; cdecl;
    {class} function _GetKEY_MARGIN_RIGHT: JString; cdecl;
    {class} function _GetKEY_MARGIN_TOP: JString; cdecl;
    {class} function _GetKEY_TEXT_SIZE: JString; cdecl;
    {class} function _GetKEY_TYPEFACE: JString; cdecl;
    {class} function _GetKEY_WEIGHT: JString; cdecl;
    {class} function _GetVAL_ALIGN_CENTER: Integer; cdecl;
    {class} function _GetVAL_ALIGN_LEFT: Integer; cdecl;
    {class} function _GetVAL_ALIGN_RIGHT: Integer; cdecl;
    {class} function init: JPrinterAttributes; cdecl;
    {class} property Companion: JPrinterAttributes_Companion read _GetCompanion;
    {class} property KEY_ALIGN: JString read _GetKEY_ALIGN;
    {class} property KEY_LINE_SPACE: JString read _GetKEY_LINE_SPACE;
    {class} property KEY_MARGIN_BOTTOM: JString read _GetKEY_MARGIN_BOTTOM;
    {class} property KEY_MARGIN_LEFT: JString read _GetKEY_MARGIN_LEFT;
    {class} property KEY_MARGIN_RIGHT: JString read _GetKEY_MARGIN_RIGHT;
    {class} property KEY_MARGIN_TOP: JString read _GetKEY_MARGIN_TOP;
    {class} property KEY_TEXT_SIZE: JString read _GetKEY_TEXT_SIZE;
    {class} property KEY_TYPEFACE: JString read _GetKEY_TYPEFACE;
    {class} property KEY_WEIGHT: JString read _GetKEY_WEIGHT;
    {class} property VAL_ALIGN_CENTER: Integer read _GetVAL_ALIGN_CENTER;
    {class} property VAL_ALIGN_LEFT: Integer read _GetVAL_ALIGN_LEFT;
    {class} property VAL_ALIGN_RIGHT: Integer read _GetVAL_ALIGN_RIGHT;
  end;

  [JavaSignature('cielo/orders/domain/PrinterAttributes')]
  JPrinterAttributes = interface(JObject)
    ['{4F96170E-E656-4EDA-AC1D-EAD7196A0B26}']
  end;
  TJPrinterAttributes = class(TJavaGenericImport<JPrinterAttributesClass, JPrinterAttributes>) end;

  JPrinterAttributes_CompanionClass = interface(JObjectClass)
    ['{B431CF06-9AAA-4B66-914C-544AD157F368}']
    {class} //function init(P1: JDefaultConstructorMarker): JPrinterAttributes_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/PrinterAttributes$Companion')]
  JPrinterAttributes_Companion = interface(JObject)
    ['{E49C2407-69CD-474E-B4D5-B3006E827F13}']
  end;
  TJPrinterAttributes_Companion = class(TJavaGenericImport<JPrinterAttributes_CompanionClass, JPrinterAttributes_Companion>) end;

  JPurchaseClass = interface(JObjectClass)
    ['{3237FBEA-6F1A-4143-911C-C931D7630763}']
    {class} function init: JPurchase; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/Purchase')]
  JPurchase = interface(JObject)
    ['{062FCDBE-1221-4265-865A-D8BC14B7C90F}']
    function getStatus: Boolean; cdecl;//Deprecated
    procedure setStatus(P1: Boolean); cdecl;//Deprecated
  end;
  TJPurchase = class(TJavaGenericImport<JPurchaseClass, JPurchase>) end;

  JResultOrdersClass = interface(JObjectClass)
    ['{908BA64C-62A3-4C35-8272-7EF2B6AEB7EA}']
    {class} function init(P1: JParcelableResultOrders): JResultOrders; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/ResultOrders')]
  JResultOrders = interface(JObject)
    ['{575B1EEF-A7FB-4321-A865-65677F803D9A}']
    function getCurrentPage: Integer; cdecl;//Deprecated
    function getResults: JList; cdecl;//Deprecated
    function getTotalItems: Integer; cdecl;//Deprecated
    function getTotalPages: Integer; cdecl;//Deprecated
  end;
  TJResultOrders = class(TJavaGenericImport<JResultOrdersClass, JResultOrders>) end;

  Jdomain_SettingsClass = interface(JObjectClass)
    ['{20AE8596-BA07-45EB-AD50-BF06D92C7E5E}']
    {class} function _GetCompanion: JSettings_Companion; cdecl;
    {class} function getEC: JString; cdecl;
    {class} function getPOS: JString; cdecl;
    {class} function init: Jdomain_Settings; cdecl;
    {class} property Companion: JSettings_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/domain/Settings')]
  Jdomain_Settings = interface(JObject)
    ['{CF359466-F38A-417D-8E57-AC52D9034C35}']
    function getLogicNumber: JString; cdecl;
    function getMerchantCode: JString; cdecl;
    procedure setLogicNumber(P1: JString); cdecl;
    procedure setMerchantCode(P1: JString); cdecl;
  end;
  TJdomain_Settings = class(TJavaGenericImport<Jdomain_SettingsClass, Jdomain_Settings>) end;

  JSettings_CompanionClass = interface(JObjectClass)
    ['{2C71F095-A469-48DC-80B3-7F0699680275}']
    {class} //function init(P1: JDefaultConstructorMarker): JSettings_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/Settings$Companion')]
  JSettings_Companion = interface(JObject)
    ['{FCBCA057-5E7A-4A51-A4BE-63B7C0232C3A}']
    function getEC: JString; cdecl;//Deprecated
    function getPOS: JString; cdecl;//Deprecated
  end;
  TJSettings_Companion = class(TJavaGenericImport<JSettings_CompanionClass, JSettings_Companion>) end;

  Jdomain_StatusClass = interface(JEnumClass)
    ['{7FAE2FBA-48BF-48AD-9349-9A768C22C2DB}']
    {class} function _GetAPPROVED: Jdomain_Status; cdecl;
    {class} function _GetCANCELED: Jdomain_Status; cdecl;
    {class} function _GetCLOSED: Jdomain_Status; cdecl;
    {class} function _GetDRAFT: Jdomain_Status; cdecl;
    {class} function _GetENTERED: Jdomain_Status; cdecl;
    {class} function _GetPAID: Jdomain_Status; cdecl;
    {class} function _GetREJECTED: Jdomain_Status; cdecl;
    {class} function _GetRE_ENTERED: Jdomain_Status; cdecl;
    {class} function valueOf(P1: JString): Jdomain_Status; cdecl;
    {class} function values: TJavaObjectArray<Jdomain_Status>; cdecl;
    {class} property APPROVED: Jdomain_Status read _GetAPPROVED;
    {class} property CANCELED: Jdomain_Status read _GetCANCELED;
    {class} property CLOSED: Jdomain_Status read _GetCLOSED;
    {class} property DRAFT: Jdomain_Status read _GetDRAFT;
    {class} property ENTERED: Jdomain_Status read _GetENTERED;
    {class} property PAID: Jdomain_Status read _GetPAID;
    {class} property REJECTED: Jdomain_Status read _GetREJECTED;
    {class} property RE_ENTERED: Jdomain_Status read _GetRE_ENTERED;
  end;

  [JavaSignature('cielo/orders/domain/Status')]
  Jdomain_Status = interface(JEnum)
    ['{973AEA7C-C6C4-431F-B7DD-98E0C3B163EF}']
    function allowApproval: Boolean; cdecl;
    function allowCancellation: Boolean; cdecl;
    function allowClosing: Boolean; cdecl;
    function allowEntering: Boolean; cdecl;
    function allowItemEdition: Boolean; cdecl;
    function allowMarkAsPaid: Boolean; cdecl;
    function allowReEntering: Boolean; cdecl;
    function allowRejection: Boolean; cdecl;
  end;
  TJdomain_Status = class(TJavaGenericImport<Jdomain_StatusClass, Jdomain_Status>) end;

  JV40CodeClass = interface(JEnumClass)
    ['{C70E0703-6964-4C14-A62B-32DD75EC7370}']
    {class} function _GetALIMENTACAO_REFEICAO: JV40Code; cdecl;
    {class} function _GetCANCELAMENTO_VENDA: JV40Code; cdecl;
    {class} function _GetCONSULTA_PAGAMENTO_CONTA: JV40Code; cdecl;
    {class} function _GetCONSULTA_SALDO: JV40Code; cdecl;
    {class} function _GetCREDIARIO_SIMULACAO: JV40Code; cdecl;
    {class} function _GetCREDIARIO_VENDA: JV40Code; cdecl;
    {class} function _GetCREDITO_PARC_ADM: JV40Code; cdecl;
    {class} function _GetCREDITO_PARC_LOJA: JV40Code; cdecl;
    {class} function _GetCREDITO_VISTA: JV40Code; cdecl;
    {class} function _GetCompanion: JV40Code_Companion; cdecl;
    {class} function _GetDEBITO_PRE_DATADO: JV40Code; cdecl;
    {class} function _GetDEBITO_VISTA: JV40Code; cdecl;
    {class} function _GetFECHAMENTO_LOTE: JV40Code; cdecl;
    {class} function _GetFROTAS: JV40Code; cdecl;
    {class} function _GetINFORMACOES_ADICIONAIS: JV40Code; cdecl;
    {class} function _GetINICIALIZACAO: JV40Code; cdecl;
    {class} function _GetPAGAMENTO_CONTA: JV40Code; cdecl;
    {class} function _GetPRE_AUTORIZACAO: JV40Code; cdecl;
    {class} function _GetRECARGA_CELULAR_CREDITO: JV40Code; cdecl;
    {class} function _GetRECARGA_CELULAR_DEBITO: JV40Code; cdecl;
    {class} function _GetRESGATE_PREMIOS: JV40Code; cdecl;
    {class} function _GetSAQUE: JV40Code; cdecl;
    {class} function _GetSENHA_OPERADOR: JV40Code; cdecl;
    {class} function _GetSENHA_SUPERVISOR: JV40Code; cdecl;
    {class} function _GetTESTE_COMUNICACAO: JV40Code; cdecl;
    {class} function _GetUNKNOWN: JV40Code; cdecl;
    {class} function _GetVISA_CASH_CONSUMO: JV40Code; cdecl;
    {class} function _GetVISA_CASH_EXTRATO: JV40Code; cdecl;
    {class} function _GetVISA_CASH_SALDO: JV40Code; cdecl;
    {class} function valueOf(P1: JString): JV40Code; cdecl;
    {class} function values: TJavaObjectArray<JV40Code>; cdecl;
    {class} property ALIMENTACAO_REFEICAO: JV40Code read _GetALIMENTACAO_REFEICAO;
    {class} property CANCELAMENTO_VENDA: JV40Code read _GetCANCELAMENTO_VENDA;
    {class} property CONSULTA_PAGAMENTO_CONTA: JV40Code read _GetCONSULTA_PAGAMENTO_CONTA;
    {class} property CONSULTA_SALDO: JV40Code read _GetCONSULTA_SALDO;
    {class} property CREDIARIO_SIMULACAO: JV40Code read _GetCREDIARIO_SIMULACAO;
    {class} property CREDIARIO_VENDA: JV40Code read _GetCREDIARIO_VENDA;
    {class} property CREDITO_PARC_ADM: JV40Code read _GetCREDITO_PARC_ADM;
    {class} property CREDITO_PARC_LOJA: JV40Code read _GetCREDITO_PARC_LOJA;
    {class} property CREDITO_VISTA: JV40Code read _GetCREDITO_VISTA;
    {class} property Companion: JV40Code_Companion read _GetCompanion;
    {class} property DEBITO_PRE_DATADO: JV40Code read _GetDEBITO_PRE_DATADO;
    {class} property DEBITO_VISTA: JV40Code read _GetDEBITO_VISTA;
    {class} property FECHAMENTO_LOTE: JV40Code read _GetFECHAMENTO_LOTE;
    {class} property FROTAS: JV40Code read _GetFROTAS;
    {class} property INFORMACOES_ADICIONAIS: JV40Code read _GetINFORMACOES_ADICIONAIS;
    {class} property INICIALIZACAO: JV40Code read _GetINICIALIZACAO;
    {class} property PAGAMENTO_CONTA: JV40Code read _GetPAGAMENTO_CONTA;
    {class} property PRE_AUTORIZACAO: JV40Code read _GetPRE_AUTORIZACAO;
    {class} property RECARGA_CELULAR_CREDITO: JV40Code read _GetRECARGA_CELULAR_CREDITO;
    {class} property RECARGA_CELULAR_DEBITO: JV40Code read _GetRECARGA_CELULAR_DEBITO;
    {class} property RESGATE_PREMIOS: JV40Code read _GetRESGATE_PREMIOS;
    {class} property SAQUE: JV40Code read _GetSAQUE;
    {class} property SENHA_OPERADOR: JV40Code read _GetSENHA_OPERADOR;
    {class} property SENHA_SUPERVISOR: JV40Code read _GetSENHA_SUPERVISOR;
    {class} property TESTE_COMUNICACAO: JV40Code read _GetTESTE_COMUNICACAO;
    {class} property UNKNOWN: JV40Code read _GetUNKNOWN;
    {class} property VISA_CASH_CONSUMO: JV40Code read _GetVISA_CASH_CONSUMO;
    {class} property VISA_CASH_EXTRATO: JV40Code read _GetVISA_CASH_EXTRATO;
    {class} property VISA_CASH_SALDO: JV40Code read _GetVISA_CASH_SALDO;
  end;

  [JavaSignature('cielo/orders/domain/V40Code')]
  JV40Code = interface(JEnum)
    ['{88C1A0BE-347F-4C86-8C28-EFF5413E8B78}']
    function getCode: Integer; cdecl;
  end;
  TJV40Code = class(TJavaGenericImport<JV40CodeClass, JV40Code>) end;

  JV40Code_CompanionClass = interface(JObjectClass)
    ['{9DB5393C-9679-4DA4-9E1E-1AAACB6F5AE4}']
    {class} //function init(P1: JDefaultConstructorMarker): JV40Code_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/V40Code$Companion')]
  JV40Code_Companion = interface(JObject)
    ['{765E8D36-873B-454D-85F7-666ADB98F054}']
    function getByCode(P1: Integer): JV40Code; cdecl;//Deprecated
  end;
  TJV40Code_Companion = class(TJavaGenericImport<JV40Code_CompanionClass, JV40Code_Companion>) end;

  JPrimaryProductExtensionKtClass = interface(JObjectClass)
    ['{C59E0EB4-5740-4295-9F53-A2BC2FDC8A7B}']
    {class} procedure addSecondaryProduct(P1: JPrimaryProduct; P2: JCursor); cdecl;//Deprecated
    {class} procedure build(P1: JPrimaryProduct; P2: JCursor); cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/extension/PrimaryProductExtensionKt')]
  JPrimaryProductExtensionKt = interface(JObject)
    ['{04DCA3B5-E872-4A59-9E3B-BB320CBE990A}']
  end;
  TJPrimaryProductExtensionKt = class(TJavaGenericImport<JPrimaryProductExtensionKtClass, JPrimaryProductExtensionKt>) end;

  JSettingsExtensionKtClass = interface(JObjectClass)
    ['{B5B95D10-A8DA-4C9A-8479-F2A6DACCD468}']
    {class} procedure build(P1: Jdomain_Settings; P2: JCursor); cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/extension/SettingsExtensionKt')]
  JSettingsExtensionKt = interface(JObject)
    ['{D40ECA16-3BA2-4733-AB4E-96F03F70DE0E}']
  end;
  TJSettingsExtensionKt = class(TJavaGenericImport<JSettingsExtensionKtClass, JSettingsExtensionKt>) end;

  JPrimaryProductClass = interface(JObjectClass)
    ['{34D9C9D1-76AC-4347-A663-5E8EC2ED2523}']
    {class} function init: JPrimaryProduct; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/product/PrimaryProduct')]
  JPrimaryProduct = interface(JObject)
    ['{93D0EF4E-A418-45DB-8835-F86093803376}']
    function getCode: JString; cdecl;//Deprecated
    function getId: Int64; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
    function getSecondaryProducts: JArrayList; cdecl;//Deprecated
    procedure setCode(P1: JString); cdecl;//Deprecated
    procedure setId(P1: Int64); cdecl;//Deprecated
    procedure setName(P1: JString); cdecl;//Deprecated
    procedure setSecondaryProducts(P1: JArrayList); cdecl;//Deprecated
  end;
  TJPrimaryProduct = class(TJavaGenericImport<JPrimaryProductClass, JPrimaryProduct>) end;

  JProductsColumnsNamesClass = interface(JObjectClass)
    ['{1D887190-2384-4EF1-8604-2D9F4B9C769A}']
    {class} function _GetCompanion: JProductsColumnsNames_Companion; cdecl;
    {class} function getPRIMARY_PRODUCT_CODE: JString; cdecl;
    {class} function getPRIMARY_PRODUCT_ID: JString; cdecl;
    {class} function getPRIMARY_PRODUCT_NAME: JString; cdecl;
    {class} function getSECONDARY_PRODUCT_CODE: JString; cdecl;
    {class} function getSECONDARY_PRODUCT_ID: JString; cdecl;
    {class} function getSECONDARY_PRODUCT_NAME: JString; cdecl;
    {class} function init: JProductsColumnsNames; cdecl;
    {class} property Companion: JProductsColumnsNames_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/orders/domain/product/ProductsColumnsNames')]
  JProductsColumnsNames = interface(JObject)
    ['{AB836DBE-3248-4070-8BF0-74FEF3C3995B}']
  end;
  TJProductsColumnsNames = class(TJavaGenericImport<JProductsColumnsNamesClass, JProductsColumnsNames>) end;

  JProductsColumnsNames_CompanionClass = interface(JObjectClass)
    ['{B34E4201-946E-44EA-A5C8-66580AB315E6}']
    {class} //function init(P1: JDefaultConstructorMarker): JProductsColumnsNames_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/product/ProductsColumnsNames$Companion')]
  JProductsColumnsNames_Companion = interface(JObject)
    ['{2F651CD5-8942-4819-A8EF-41B519BCE896}']
    function getPRIMARY_PRODUCT_CODE: JString; cdecl;//Deprecated
    function getPRIMARY_PRODUCT_ID: JString; cdecl;//Deprecated
    function getPRIMARY_PRODUCT_NAME: JString; cdecl;//Deprecated
    function getSECONDARY_PRODUCT_CODE: JString; cdecl;//Deprecated
    function getSECONDARY_PRODUCT_ID: JString; cdecl;//Deprecated
    function getSECONDARY_PRODUCT_NAME: JString; cdecl;//Deprecated
  end;
  TJProductsColumnsNames_Companion = class(TJavaGenericImport<JProductsColumnsNames_CompanionClass, JProductsColumnsNames_Companion>) end;

  JSecondaryProductClass = interface(JObjectClass)
    ['{03253FEA-3236-481C-93C2-94D96CF1BCB5}']
    {class} function init(P1: Int64; P2: JString; P3: JString): JSecondaryProduct; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/orders/domain/product/SecondaryProduct')]
  JSecondaryProduct = interface(JObject)
    ['{6F1128D9-F11A-4276-B411-C7F28A48B3AD}']
    function component1: Int64; cdecl;//Deprecated
    function component2: JString; cdecl;//Deprecated
    function component3: JString; cdecl;//Deprecated
    function copy(P1: Int64; P2: JString; P3: JString): JSecondaryProduct; cdecl;//Deprecated
    function equals(P1: JObject): Boolean; cdecl;//Deprecated
    function getCode: JString; cdecl;//Deprecated
    function getId: Int64; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJSecondaryProduct = class(TJavaGenericImport<JSecondaryProductClass, JSecondaryProduct>) end;

  JInfoManagerClass = interface(JObjectClass)
    ['{388D87A3-361D-4F5A-8A62-0D5A92E29498}']
    {class} function init: JInfoManager; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/info/InfoManager')]
  JInfoManager = interface(JObject)
    ['{DCAEDCB2-13DC-41EC-9F6D-116C64882581}']
    function getBatteryLevel(P1: JContext): Single; cdecl;//Deprecated
    function getDeviceModel: JDeviceModel; cdecl;//Deprecated
    function getSettings(P1: JContext): Jdomain_Settings; cdecl;//Deprecated
  end;
  TJInfoManager = class(TJavaGenericImport<JInfoManagerClass, JInfoManager>) end;

  JBaseOrderManagerClass = interface(IJavaClass)
    ['{7C9ED65E-5CB3-4762-A338-ECD79C83F572}']
  end;

  [JavaSignature('cielo/sdk/order/BaseOrderManager')]
  JBaseOrderManager = interface(IJavaInstance)
    ['{7DE862F8-7CCB-4E9D-9CF2-03F47F63869A}']
    procedure bind(P1: JActivity; P2: JServiceBindListener); cdecl;//Deprecated
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: JCancellationListener); cdecl; overload;//Deprecated
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: Int64; P5: JCancellationListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: Int64; P5: JString; P6: JString; P7: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JString; P8: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrderAdm(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;//Deprecated
    procedure checkoutOrderStore(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;//Deprecated
    function createDraftOrder(P1: JString): JOrder; cdecl;//Deprecated
    function placeOrder(P1: JOrder): JBoolean; cdecl;//Deprecated
    function retrieveOrders(P1: Integer; P2: Integer): JResultOrders; cdecl;//Deprecated
    function retrievePaymentType(P1: JContext): JList; cdecl;//Deprecated
    procedure unbind; cdecl;//Deprecated
    function updateOrder(P1: JOrder): JBoolean; cdecl;//Deprecated
  end;
  TJBaseOrderManager = class(TJavaGenericImport<JBaseOrderManagerClass, JBaseOrderManager>) end;

  JBaseOrderManager_DefaultImplsClass = interface(JObjectClass)
    ['{33762D99-1754-41C6-A1BA-DFA6E4F8A715}']
  end;

  [JavaSignature('cielo/sdk/order/BaseOrderManager$DefaultImpls')]
  JBaseOrderManager_DefaultImpls = interface(JObject)
    ['{0B45DF5A-4515-4934-A77D-73E193CFAFF4}']
  end;
  TJBaseOrderManager_DefaultImpls = class(TJavaGenericImport<JBaseOrderManager_DefaultImplsClass, JBaseOrderManager_DefaultImpls>) end;

  JOrderManagerClass = interface(JBaseOrderManagerClass)
    ['{A9F4A9C4-CEC1-4169-B78C-C7D5D0F0F409}']
    {class} function _GetCompanion: JOrderManager_Companion; cdecl;
    {class} function getVersionCode: Integer; cdecl;
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManager; cdecl;
    {class} procedure setVersionCode(P1: Integer); cdecl;
    {class} property Companion: JOrderManager_Companion read _GetCompanion;
  end;

  [JavaSignature('cielo/sdk/order/OrderManager')]
  JOrderManager = interface(JBaseOrderManager)
    ['{5FC1207B-026B-4599-AF94-84896E669A79}']
    procedure bind(P1: JActivity; P2: JServiceBindListener); cdecl;
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: JCancellationListener); cdecl; overload;
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: Int64; P5: JCancellationListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: Int64; P5: JString; P6: JString; P7: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JString; P8: JPaymentListener); cdecl; overload;
    procedure checkoutOrderAdm(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;
    procedure checkoutOrderStore(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;
    function createDraftOrder(P1: JString): JOrder; cdecl;
    function getContext: JContext; cdecl;
    function getCredentials: Jdomain_Credentials; cdecl;
    function placeOrder(P1: JOrder): JBoolean; cdecl;
    function retrieveOrders(P1: Integer; P2: Integer): JResultOrders; cdecl;
    function retrievePaymentType(P1: JContext): JList; cdecl;
    procedure setContext(P1: JContext); cdecl;
    procedure unbind; cdecl;
    function updateOrder(P1: JOrder): JBoolean; cdecl;
  end;
  TJOrderManager = class(TJavaGenericImport<JOrderManagerClass, JOrderManager>) end;

  JOrderManager_CompanionClass = interface(JObjectClass)
    ['{FEA95201-BC85-491B-BF08-F44849679E80}']
    {class} //function init(P1: JDefaultConstructorMarker): JOrderManager_Companion; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/OrderManager$Companion')]
  JOrderManager_Companion = interface(JObject)
    ['{F75BEF48-16A4-4BF0-BFCC-9843D26DA8A5}']
    function getVersionCode: Integer; cdecl;//Deprecated
    procedure setVersionCode(P1: Integer); cdecl;//Deprecated
  end;
  TJOrderManager_Companion = class(TJavaGenericImport<JOrderManager_CompanionClass, JOrderManager_Companion>) end;

  JPrinterListenerClass = interface(IJavaClass)
    ['{75B510B6-1212-4376-B2F9-86C35F08506D}']
  end;

  [JavaSignature('cielo/sdk/order/PrinterListener')]
  JPrinterListener = interface(IJavaInstance)
    ['{4D789C5D-A235-4365-8047-0FEB73B33D91}']
    procedure onError(P1: JThrowable); cdecl;//Deprecated
    procedure onPrintSuccess; cdecl;//Deprecated
    procedure onWithoutPaper; cdecl;//Deprecated
  end;
  TJPrinterListener = class(TJavaGenericImport<JPrinterListenerClass, JPrinterListener>) end;

  JPurchaseValidationListenerClass = interface(IJavaClass)
    ['{4E150C76-D335-42AB-AB7C-238C4B7306F4}']
  end;

  [JavaSignature('cielo/sdk/order/PurchaseValidationListener')]
  JPurchaseValidationListener = interface(IJavaInstance)
    ['{C2B81CE5-D3D0-4C11-BC56-27B3ECE2A519}']
    procedure onError(P1: JString; P2: Integer); cdecl;//Deprecated
    procedure onSuccess(P1: JPurchase); cdecl;//Deprecated
  end;
  TJPurchaseValidationListener = class(TJavaGenericImport<JPurchaseValidationListenerClass, JPurchaseValidationListener>) end;

  JServiceBindListenerClass = interface(IJavaClass)
    ['{3C449DDD-9EAD-4823-94AC-B52305F90CA9}']
  end;

  [JavaSignature('cielo/sdk/order/ServiceBindListener')]
  JServiceBindListener = interface(IJavaInstance)
    ['{46DEBEC2-94FB-4116-B89E-319D78AB8F4A}']
    procedure onServiceBound; cdecl;//Deprecated
    procedure onServiceBoundError(P1: JThrowable); cdecl;//Deprecated
    procedure onServiceUnbound; cdecl;//Deprecated
  end;
  TJServiceBindListener = class(TJavaGenericImport<JServiceBindListenerClass, JServiceBindListener>) end;

  JCanceledPaymentClass = interface(JSerializableClass)
    ['{B2DCD3BE-9EF9-4897-BDD7-2C1C2F9F622C}']
    {class} function init(P1: JString): JCanceledPayment; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/cancellation/CanceledPayment')]
  JCanceledPayment = interface(JSerializable)
    ['{3805FF9E-0937-4925-B48F-A0781B4847D4}']
    function getAuthCode: JString; cdecl;//Deprecated
    function getCieloCode: JString; cdecl;//Deprecated
    function getMerchantCode: JString; cdecl;//Deprecated
    function getPrimaryCode: JString; cdecl;//Deprecated
    function getPrimaryCodeName: JString; cdecl;//Deprecated
    function getReference: JString; cdecl;//Deprecated
    function getRequestDate: JString; cdecl;//Deprecated
    function getResponseCode: JString; cdecl;//Deprecated
    function getSecondaryCode: JString; cdecl;//Deprecated
    function getSecondaryCodeName: JString; cdecl;//Deprecated
    function getServerDate: JString; cdecl;//Deprecated
    function getTransactionId: JString; cdecl;//Deprecated
    function getValue: JString; cdecl;//Deprecated
  end;
  TJCanceledPayment = class(TJavaGenericImport<JCanceledPaymentClass, JCanceledPayment>) end;

  // cielo.sdk.order.cancellation.CanceledPayment$type$1
  JCancellationListenerClass = interface(IJavaClass)
    ['{8FBB3CD7-5DED-433D-8459-4801C8213D80}']
  end;

  [JavaSignature('cielo/sdk/order/cancellation/CancellationListener')]
  JCancellationListener = interface(IJavaInstance)
    ['{A6A05A83-32C2-4A0F-8D8F-F30F9BDC30F0}']
    procedure onCancel; cdecl;//Deprecated
    procedure onError(P1: JPaymentError); cdecl;//Deprecated
    procedure onSuccess(P1: JOrder); cdecl;//Deprecated
  end;
  TJCancellationListener = class(TJavaGenericImport<JCancellationListenerClass, JCancellationListener>) end;

  JPaymentClass = interface(JSerializableClass)
    ['{05A1FF07-D8EE-4E57-9C96-AE66D9616A65}']
    {class} function init(P1: JParcelableTransaction): JPayment; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/payment/Payment')]
  JPayment = interface(JSerializable)
    ['{8B3BD49B-8D13-4CA8-8569-1E8EE76D1BA9}']
    function getAccessKey: JString; cdecl;//Deprecated
    function getAmount: Int64; cdecl;//Deprecated
    function getApplicationName: JString; cdecl;//Deprecated
    function getAuthCode: JString; cdecl;//Deprecated
    function getBrand: JString; cdecl;//Deprecated
    function getCieloCode: JString; cdecl;//Deprecated
    function getDescription: JString; cdecl;//Deprecated
    function getDiscountedAmount: Int64; cdecl;//Deprecated
    function getExternalId: JString; cdecl;//Deprecated
    function getId: JString; cdecl;//Deprecated
    function getInstallments: Int64; cdecl;//Deprecated
    function getMask: JString; cdecl;//Deprecated
    function getMerchantCode: JString; cdecl;//Deprecated
    function getPaymentFields: JHashMap; cdecl;//Deprecated
    function getPrimaryCode: JString; cdecl;//Deprecated
    function getRequestDate: JString; cdecl;//Deprecated
    function getSecondaryCode: JString; cdecl;//Deprecated
    function getTerminal: JString; cdecl;//Deprecated
  end;
  TJPayment = class(TJavaGenericImport<JPaymentClass, JPayment>) end;

  // cielo.sdk.order.payment.Payment$type$1
  JPaymentCodeClass = interface(JEnumClass)
    ['{31156D3A-0F9B-4166-ACEE-4A6EB674CF13}']
    {class} function _GetCREDITO_AVISTA: JPaymentCode; cdecl;
    {class} function _GetCREDITO_PARCELADO_ADM: JPaymentCode; cdecl;
    {class} function _GetCREDITO_PARCELADO_LOJA: JPaymentCode; cdecl;
    {class} function _GetDEBITO_AVISTA: JPaymentCode; cdecl;
    {class} function _GetDEBITO_PREDATADO: JPaymentCode; cdecl;
    {class} function _GetPRE_AUTORIZACAO: JPaymentCode; cdecl;
    {class} function _GetVOUCHER_ALIMENTACAO: JPaymentCode; cdecl;
    {class} function _GetVOUCHER_REFEICAO: JPaymentCode; cdecl;
    {class} function valueOf(P1: JString): JPaymentCode; cdecl;
    {class} function values: TJavaObjectArray<JPaymentCode>; cdecl;
    {class} property CREDITO_AVISTA: JPaymentCode read _GetCREDITO_AVISTA;
    {class} property CREDITO_PARCELADO_ADM: JPaymentCode read _GetCREDITO_PARCELADO_ADM;
    {class} property CREDITO_PARCELADO_LOJA: JPaymentCode read _GetCREDITO_PARCELADO_LOJA;
    {class} property DEBITO_AVISTA: JPaymentCode read _GetDEBITO_AVISTA;
    {class} property DEBITO_PREDATADO: JPaymentCode read _GetDEBITO_PREDATADO;
    {class} property PRE_AUTORIZACAO: JPaymentCode read _GetPRE_AUTORIZACAO;
    {class} property VOUCHER_ALIMENTACAO: JPaymentCode read _GetVOUCHER_ALIMENTACAO;
    {class} property VOUCHER_REFEICAO: JPaymentCode read _GetVOUCHER_REFEICAO;
  end;

  [JavaSignature('cielo/sdk/order/payment/PaymentCode')]
  JPaymentCode = interface(JEnum)
    ['{7BB1F771-84B8-403F-AF3F-268C18C47A29}']
    function getCode: Int64; cdecl;
  end;
  TJPaymentCode = class(TJavaGenericImport<JPaymentCodeClass, JPaymentCode>) end;

  JPaymentErrorClass = interface(JSerializableClass)
    ['{466D224F-83E6-4A28-9D12-4255F117DB7D}']
    {class} function init(P1: JString): JPaymentError; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/payment/PaymentError')]
  JPaymentError = interface(JSerializable)
    ['{42036E03-FE7F-43D0-88B6-20F674DF2D3E}']
    function getDescription: JString; cdecl;//Deprecated
    procedure setDescription(P1: JString); cdecl;//Deprecated
  end;
  TJPaymentError = class(TJavaGenericImport<JPaymentErrorClass, JPaymentError>) end;

  JPaymentListenerClass = interface(IJavaClass)
    ['{E6AC05ED-CBCC-488C-8C91-5D81DFA8F7AB}']
  end;

  [JavaSignature('cielo/sdk/order/payment/PaymentListener')]
  JPaymentListener = interface(IJavaInstance)
    ['{2DA2D3B6-5D33-47B8-9B2F-39A19D957AF6}']
    procedure onCancel; cdecl;//Deprecated
    procedure onError(P1: JPaymentError); cdecl;//Deprecated
    procedure onPayment(P1: JOrder); cdecl;//Deprecated
    procedure onStart; cdecl;//Deprecated
  end;
  TJPaymentListener = class(TJavaGenericImport<JPaymentListenerClass, JPaymentListener>) end;

  JPaymentMethodClass = interface(JObjectClass)
    ['{DA16691A-7900-4C70-8160-44803EB0D236}']
    {class} function init: JPaymentMethod; cdecl; overload;//Deprecated
    {class} function init(P1: JString; P2: JString): JPaymentMethod; cdecl; overload;//Deprecated
    {class} //function init(P1: JString; P2: JString; P3: Integer; P4: JDefaultConstructorMarker): JPaymentMethod; cdecl; overload;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/payment/PaymentMethod')]
  JPaymentMethod = interface(JObject)
    ['{CD521FA2-FDE3-4A78-A373-FB008220BDEE}']
    function component1: JString; cdecl;//Deprecated
    function component2: JString; cdecl;//Deprecated
    function copy(P1: JString; P2: JString): JPaymentMethod; cdecl;//Deprecated
    function equals(P1: JObject): Boolean; cdecl;//Deprecated
    function getPrimaryCode: JString; cdecl;//Deprecated
    function getSecondaryCode: JString; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
    procedure setPrimaryCode(P1: JString); cdecl;//Deprecated
    procedure setSecondaryCode(P1: JString); cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJPaymentMethod = class(TJavaGenericImport<JPaymentMethodClass, JPaymentMethod>) end;

  JExtensionsKtClass = interface(JObjectClass)
    ['{43BEEC5C-D8EE-4AFF-B634-20545DA74458}']
    {class} function toParcelable(P1: JPayment): JParcelableTransaction; cdecl; overload;//Deprecated
    {class} function toParcelable(P1: Jdomain_Item): JParcelableItem; cdecl; overload;//Deprecated
    {class} function toParcelable(P1: JOrder; P2: Jdomain_Credentials): JParcelableOrder; cdecl; overload;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/utils/ExtensionsKt')]
  JExtensionsKt = interface(JObject)
    ['{A04AECF0-7558-4B39-9594-640B3535AD49}']
  end;
  TJExtensionsKt = class(TJavaGenericImport<JExtensionsKtClass, JExtensionsKt>) end;

  JSdkUtilsKtClass = interface(JObjectClass)
    ['{7D76AF98-9BD7-4275-9795-2C4A8E1A5F4C}']
    {class} function checkMerchantCodeEnabled(P1: JContext; P2: JString): Boolean; cdecl;//Deprecated
    {class} function getPaymentCodes(P1: JContext; P2: JPaymentCode): JPaymentMethod; cdecl;//Deprecated
    {class} function getPaymentTypes(P1: JContext): JList; cdecl;//Deprecated
    {class} function isLioV2: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/utils/SdkUtilsKt')]
  JSdkUtilsKt = interface(JObject)
    ['{134B8684-034E-4C3C-836A-ED62BE315879}']
  end;
  TJSdkUtilsKt = class(TJavaGenericImport<JSdkUtilsKtClass, JSdkUtilsKt>) end;

  JSdkUtilsKt_WhenMappingsClass = interface(JObjectClass)
    ['{300DB296-CDC9-48ED-9E0E-9EA9119A5968}']
    {class} function _GetEnumSwitchMapping: TJavaArray<Integer>; cdecl;
    {class} property EnumSwitchMapping: TJavaArray<Integer> read _GetEnumSwitchMapping;
  end;

  [JavaSignature('cielo/sdk/order/utils/SdkUtilsKt$WhenMappings')]
  JSdkUtilsKt_WhenMappings = interface(JObject)
    ['{E5713BC6-50C3-4B2A-ADF8-D7F30607E12D}']
  end;
  TJSdkUtilsKt_WhenMappings = class(TJavaGenericImport<JSdkUtilsKt_WhenMappingsClass, JSdkUtilsKt_WhenMappings>) end;

  Jutils_SecureRandomClass = interface(JObjectClass)
    ['{0822FAE3-AB98-4F1A-AD37-BD778F41F8C3}']
    {class} function _GetINSTANCE: Jutils_SecureRandom; cdecl;
    {class} property INSTANCE: Jutils_SecureRandom read _GetINSTANCE;
  end;

  [JavaSignature('cielo/sdk/order/utils/SecureRandom')]
  Jutils_SecureRandom = interface(JObject)
    ['{24D7D1D1-0E16-4D8E-BED9-169336E471E1}']
    function uuid: JString; cdecl;
  end;
  TJutils_SecureRandom = class(TJavaGenericImport<Jutils_SecureRandomClass, Jutils_SecureRandom>) end;

  JOrderManagerImplv1Class = interface(JBaseOrderManagerClass)
    ['{BEA343DF-C442-4CA6-9A15-E6F6162BA5EF}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv1; cdecl;
  end;

  [JavaSignature('cielo/sdk/order/v1/OrderManagerImplv1')]
  JOrderManagerImplv1 = interface(JBaseOrderManager)
    ['{DDC02B40-99B0-4813-9B70-7526AD2E6DB8}']
    function _GetappInfo: Jentity_ApplicationInfo; cdecl;
    procedure _SetappInfo(Value: Jentity_ApplicationInfo); cdecl;
    procedure bind(P1: JActivity; P2: JServiceBindListener); cdecl;
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: JCancellationListener); cdecl; overload;
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: Int64; P5: JCancellationListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: Int64; P5: JString; P6: JString; P7: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JPaymentListener); cdecl; overload;
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JString; P8: JPaymentListener); cdecl; overload;
    procedure checkoutOrderAdm(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;
    procedure checkoutOrderStore(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;
    function createDraftOrder(P1: JString): JOrder; cdecl;
    function getAppInfo: Jentity_ApplicationInfo; cdecl;
    function getCredentials: Jdomain_Credentials; cdecl;
    function getOPERATION_TIMED_OUT: JString; cdecl;
    function placeOrder(P1: JOrder): JBoolean; cdecl;
    function retrieveOrders(P1: Integer; P2: Integer): JResultOrders; cdecl;
    function retrievePaymentType(P1: JContext): JList; cdecl;
    procedure setAppInfo(P1: Jentity_ApplicationInfo); cdecl;
    procedure unbind; cdecl;
    function updateOrder(P1: JOrder): JBoolean; cdecl;
    property appInfo: Jentity_ApplicationInfo read _GetappInfo write _SetappInfo;
  end;
  TJOrderManagerImplv1 = class(TJavaGenericImport<JOrderManagerImplv1Class, JOrderManagerImplv1>) end;

  JOrderManagerImplv1_CancellationBroadcastReceiverClass = interface(JBroadcastReceiverClass)
    ['{43141C9A-54ED-48DB-9508-DB1AB88379D2}']
    {class} function init: JOrderManagerImplv1_CancellationBroadcastReceiver; cdecl;
  end;

  [JavaSignature('cielo/sdk/order/v1/OrderManagerImplv1$CancellationBroadcastReceiver')]
  JOrderManagerImplv1_CancellationBroadcastReceiver = interface(JBroadcastReceiver)
    ['{54EC17CD-24E1-48A6-AA27-CF73F77C68B0}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJOrderManagerImplv1_CancellationBroadcastReceiver = class(TJavaGenericImport<JOrderManagerImplv1_CancellationBroadcastReceiverClass, JOrderManagerImplv1_CancellationBroadcastReceiver>) end;

  JOrderManagerImplv1_PaymentBroadcastReceiverClass = interface(JBroadcastReceiverClass)
    ['{96FAB0B7-D487-4512-86EC-6FB077334A66}']
    {class} function init: JOrderManagerImplv1_PaymentBroadcastReceiver; cdecl;
  end;

  [JavaSignature('cielo/sdk/order/v1/OrderManagerImplv1$PaymentBroadcastReceiver')]
  JOrderManagerImplv1_PaymentBroadcastReceiver = interface(JBroadcastReceiver)
    ['{8283C754-63A0-4EA3-AECC-7934E5339813}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJOrderManagerImplv1_PaymentBroadcastReceiver = class(TJavaGenericImport<JOrderManagerImplv1_PaymentBroadcastReceiverClass, JOrderManagerImplv1_PaymentBroadcastReceiver>) end;

  // cielo.sdk.order.v1.OrderManagerImplv1$bind$1
  // cielo.sdk.order.v1.OrderManagerImplv1$bind$2
  JsortedByDescending_1Class = interface(JComparatorClass)
    ['{940713F7-5409-40E2-99A0-6C94B472AB56}']
  end;

  [JavaSignature('cielo/sdk/order/v1/OrderManagerImplv1$orderTransactionsByRequestDate$$inlined$sortedByDescending$1')]
  JsortedByDescending_1 = interface(JComparator)
    ['{E8AC0203-5739-4399-8D26-C9CF72AD6951}']
    function compare(P1: JParcelableTransaction; P2: JParcelableTransaction): Integer; cdecl;//Deprecated
  end;
  TJsortedByDescending_1 = class(TJavaGenericImport<JsortedByDescending_1Class, JsortedByDescending_1>) end;

  JserviceConnection_1Class = interface(JServiceConnectionClass)
    ['{D9A3753C-8B65-4410-B58F-2FAD65293A0E}']
  end;

  [JavaSignature('cielo/sdk/order/v1/OrderManagerImplv1$serviceConnection$1')]
  JserviceConnection_1 = interface(JServiceConnection)
    ['{3190CF8C-FA6F-43F4-B9BA-1B1D17B86D9C}']
    procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;
    procedure onServiceDisconnected(P1: JComponentName); cdecl;
  end;
  TJserviceConnection_1 = class(TJavaGenericImport<JserviceConnection_1Class, JserviceConnection_1>) end;

  // cielo.sdk.order.v1.OrderManagerImplv1$validateCredentials$1
  // cielo.sdk.order.v1.OrderManagerImplv1$validateCredentials$2
  // cielo.sdk.order.v1.OrderManagerImplv1$validateCredentials$okHttpClient$1
  JOrderManagerImplv2Class = interface(JOrderManagerImplv1Class)
    ['{7EBE867D-7F69-42A2-9CD6-71E6F32B0F02}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv2; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/v2/OrderManagerImplv2')]
  JOrderManagerImplv2 = interface(JOrderManagerImplv1)
    ['{E451641F-07CC-433B-99E7-A47F8BC941EF}']
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: JPaymentListener); cdecl;//Deprecated
    function retrievePaymentType(P1: JContext): JList; cdecl;//Deprecated
  end;
  TJOrderManagerImplv2 = class(TJavaGenericImport<JOrderManagerImplv2Class, JOrderManagerImplv2>) end;

  JOrderManagerImplv3Class = interface(JOrderManagerImplv2Class)
    ['{3B6EAB6D-2AB8-41F6-8D23-431F1096A124}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv3; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/v3/OrderManagerImplv3')]
  JOrderManagerImplv3 = interface(JOrderManagerImplv2)
    ['{D42433CD-BF90-40D1-8C54-DB83D4FB9BAA}']
    function retrieveOrders(P1: Integer; P2: Integer): JResultOrders; cdecl;//Deprecated
  end;
  TJOrderManagerImplv3 = class(TJavaGenericImport<JOrderManagerImplv3Class, JOrderManagerImplv3>) end;

  JOrderManagerImplv4Class = interface(JOrderManagerImplv3Class)
    ['{FFE9ACF0-C895-404A-9E02-DD5866D2E89F}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv4; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/v4/OrderManagerImplv4')]
  JOrderManagerImplv4 = interface(JOrderManagerImplv3)
    ['{D6820BDF-42B7-40D3-8509-9E24E0CC4567}']
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: JCancellationListener); cdecl; overload;//Deprecated
    procedure cancelOrder(P1: JContext; P2: JString; P3: JPayment; P4: Int64; P5: JCancellationListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JPaymentListener); cdecl;//Deprecated
    function updateOrder(P1: JOrder): JBoolean; cdecl;//Deprecated
  end;
  TJOrderManagerImplv4 = class(TJavaGenericImport<JOrderManagerImplv4Class, JOrderManagerImplv4>) end;

  JOrderManagerImplv5Class = interface(JOrderManagerImplv4Class)
    ['{F347AA9E-7530-4063-BC98-B41E790E7960}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv5; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/v5/OrderManagerImplv5')]
  JOrderManagerImplv5 = interface(JOrderManagerImplv4)
    ['{D1669DE1-C302-4926-8C7A-60071ABE45B1}']
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JPaymentListener); cdecl;//Deprecated
  end;
  TJOrderManagerImplv5 = class(TJavaGenericImport<JOrderManagerImplv5Class, JOrderManagerImplv5>) end;

  JOrderManagerImplv6Class = interface(JOrderManagerImplv5Class)
    ['{F0400A94-D8C4-40C8-AF08-5ED76B065A58}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv6; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/v5/OrderManagerImplv6')]
  JOrderManagerImplv6 = interface(JOrderManagerImplv5)
    ['{1199EC77-8FB0-4789-94B9-FE21B4C197E3}']
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JString; P4: JString; P5: Int64; P6: JString; P7: JString; P8: JPaymentListener); cdecl;//Deprecated
  end;
  TJOrderManagerImplv6 = class(TJavaGenericImport<JOrderManagerImplv6Class, JOrderManagerImplv6>) end;

  JOrderManagerImplv7Class = interface(JOrderManagerImplv6Class)
    ['{1C62C4AA-13BD-4C3D-85DC-31A0354324F6}']
    {class} function init(P1: Jdomain_Credentials; P2: JContext): JOrderManagerImplv7; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/order/v7/OrderManagerImplv7')]
  JOrderManagerImplv7 = interface(JOrderManagerImplv6)
    ['{E7904973-F933-4738-B5E3-27F91F7FAFB0}']
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrder(P1: JString; P2: Int64; P3: JPaymentCode; P4: Int64; P5: JString; P6: JString; P7: JPaymentListener); cdecl; overload;//Deprecated
    procedure checkoutOrderAdm(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;//Deprecated
    procedure checkoutOrderStore(P1: JString; P2: Int64; P3: Int64; P4: JPaymentListener); cdecl;//Deprecated
  end;
  TJOrderManagerImplv7 = class(TJavaGenericImport<JOrderManagerImplv7Class, JOrderManagerImplv7>) end;

  Jordermanager_BuildConfigClass = interface(JObjectClass)
    ['{CAC88C93-6774-4329-866F-149188575F18}']
    {class} function _GetAPPLICATION_ID: JString; cdecl;
    {class} function _GetBUILD_TYPE: JString; cdecl;
    {class} function _GetDEBUG: Boolean; cdecl;
    {class} function _GetFLAVOR: JString; cdecl;
    {class} function _GetVERSION_CODE: Integer; cdecl;
    {class} function _GetVERSION_NAME: JString; cdecl;
    {class} function init: Jordermanager_BuildConfig; cdecl;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('cielo/sdk/ordermanager/BuildConfig')]
  Jordermanager_BuildConfig = interface(JObject)
    ['{F9C21FF3-7D0A-41C8-98AE-F21B773F7FD3}']
  end;
  TJordermanager_BuildConfig = class(TJavaGenericImport<Jordermanager_BuildConfigClass, Jordermanager_BuildConfig>) end;

  JPrinterManagerClass = interface(JObjectClass)
    ['{789831C9-E663-4E31-B479-CFAAD474D312}']
    {class} function init(P1: JContext): JPrinterManager; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/printer/PrinterManager')]
  JPrinterManager = interface(JObject)
    ['{FC54D53D-5C12-4724-B7EE-BB6C1CA3606E}']
    //function getPrinterClient: JPrinterClientImpl; cdecl;//Deprecated
    procedure printImage(P1: JBitmap; P2: JMap; P3: JPrinterListener); cdecl;//Deprecated
    procedure printMultipleColumnText(P1: TJavaObjectArray<JString>; P2: JList; P3: JPrinterListener); cdecl;//Deprecated
    procedure printText(P1: JString; P2: JMap; P3: JPrinterListener); cdecl;//Deprecated
    //procedure setPrinterClient(P1: JPrinterClientImpl); cdecl;//Deprecated
  end;
  TJPrinterManager = class(TJavaGenericImport<JPrinterManagerClass, JPrinterManager>) end;

  // cielo.sdk.printer.PrinterManager$configPrinterListener$1
  JAccessTokenManagementApiClass = interface(IJavaClass)
    ['{7E79CB32-DEF7-4BFF-9BBA-59986592245D}']
  end;

  [JavaSignature('cielo/sdk/repository/remote/retrofit/AccessTokenManagementApi')]
  JAccessTokenManagementApi = interface(IJavaInstance)
    ['{B215592B-2703-4669-BA4E-B446E6FA67C3}']
    //function accessTokenValidation: Jreactivex_Observable; cdecl;//Deprecated
  end;
  TJAccessTokenManagementApi = class(TJavaGenericImport<JAccessTokenManagementApiClass, JAccessTokenManagementApi>) end;

  JPurchaseApiClass = interface(IJavaClass)
    ['{0B92C33D-D3ED-4ED0-89C9-A9EA42D947A9}']
  end;

  [JavaSignature('cielo/sdk/repository/remote/retrofit/PurchaseApi')]
  JPurchaseApi = interface(IJavaInstance)
    ['{9FAA06F9-177B-456B-ABCB-DFF8C5818C45}']
    //function verifyPurchase(P1: JString; P2: JString; P3: JString): Jreactivex_Observable; cdecl;//Deprecated
  end;
  TJPurchaseApi = class(TJavaGenericImport<JPurchaseApiClass, JPurchaseApi>) end;

  Jentity_ApplicationInfoClass = interface(JObjectClass)
    ['{7E707E6E-4027-4362-B1C2-33E5D6BD9641}']
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JDate): Jentity_ApplicationInfo; cdecl;//Deprecated
  end;

  [JavaSignature('cielo/sdk/repository/remote/retrofit/entity/ApplicationInfo')]
  Jentity_ApplicationInfo = interface(JObject)
    ['{292B3341-2259-4ADB-85C8-B75420E07F57}']
    function component1: JString; cdecl;//Deprecated
    function component2: JString; cdecl;//Deprecated
    function component3: JString; cdecl;//Deprecated
    function component4: JString; cdecl;//Deprecated
    function component5: JDate; cdecl;//Deprecated
    function copy(P1: JString; P2: JString; P3: JString; P4: JString; P5: JDate): Jentity_ApplicationInfo; cdecl;//Deprecated
    function equals(P1: JObject): Boolean; cdecl;//Deprecated
    function getAccessToken: JString; cdecl;//Deprecated
    function getClientId: JString; cdecl;//Deprecated
    function getCreationDate: JDate; cdecl;//Deprecated
    function getOwner: JString; cdecl;//Deprecated
    function getStatus: JString; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
    procedure setClientId(P1: JString); cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJentity_ApplicationInfo = class(TJavaGenericImport<Jentity_ApplicationInfoClass, Jentity_ApplicationInfo>) end;

  JAbstractStringBuilderClass = interface(JObjectClass)
    ['{A3321EF2-EA76-44CD-90CE-DFDADB9936BD}']
    {class} function codePointAt(index: Integer): Integer; cdecl;
    {class} function codePointBefore(index: Integer): Integer; cdecl;
    {class} function codePointCount(start: Integer; end_: Integer): Integer; cdecl;
    {class} function indexOf(string_: JString): Integer; cdecl; overload;
    {class} function indexOf(subString: JString; start: Integer): Integer; cdecl; overload;
    {class} function lastIndexOf(string_: JString): Integer; cdecl; overload;
    {class} procedure setCharAt(index: Integer; ch: Char); cdecl;
    {class} procedure setLength(length: Integer); cdecl;
    {class} function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;
    {class} procedure trimToSize; cdecl;
  end;

  [JavaSignature('java/lang/AbstractStringBuilder')]
  JAbstractStringBuilder = interface(JObject)
    ['{39A0E6C5-8F79-44ED-BECB-02252CA2F5C0}']
    function capacity: Integer; cdecl;
    function charAt(index: Integer): Char; cdecl;
    procedure ensureCapacity(min: Integer); cdecl;
    procedure getChars(start: Integer; end_: Integer; dst: TJavaArray<Char>; dstStart: Integer); cdecl;
    function lastIndexOf(subString: JString; start: Integer): Integer; cdecl; overload;
    function length: Integer; cdecl;
    function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;
    function substring(start: Integer): JString; cdecl; overload;
    function substring(start: Integer; end_: Integer): JString; cdecl; overload;
    function toString: JString; cdecl;
  end;
  TJAbstractStringBuilder = class(TJavaGenericImport<JAbstractStringBuilderClass, JAbstractStringBuilder>) end;

  JStringBufferClass = interface(JAbstractStringBuilderClass)
    ['{F6BF4ECD-EA63-4AF3-A901-99D4221796D7}']
    {class} function init: JStringBuffer; cdecl; overload;
    {class} function init(capacity: Integer): JStringBuffer; cdecl; overload;
    {class} function init(string_: JString): JStringBuffer; cdecl; overload;
    {class} function init(cs: JCharSequence): JStringBuffer; cdecl; overload;
    {class} function append(ch: Char): JStringBuffer; cdecl; overload;
    {class} function append(d: Double): JStringBuffer; cdecl; overload;
    {class} function append(f: Single): JStringBuffer; cdecl; overload;
    {class} function append(string_: JString): JStringBuffer; cdecl; overload;
    {class} function append(sb: JStringBuffer): JStringBuffer; cdecl; overload;
    {class} function append(chars: TJavaArray<Char>): JStringBuffer; cdecl; overload;
    {class} function appendCodePoint(codePoint: Integer): JStringBuffer; cdecl;
    {class} function charAt(index: Integer): Char; cdecl;
    {class} function codePointAt(index: Integer): Integer; cdecl;
    {class} function delete(start: Integer; end_: Integer): JStringBuffer; cdecl;//Deprecated
    {class} function deleteCharAt(location: Integer): JStringBuffer; cdecl;//Deprecated
    {class} procedure ensureCapacity(min: Integer); cdecl;//Deprecated
    {class} function insert(index: Integer; b: Boolean): JStringBuffer; cdecl; overload;//Deprecated
    {class} function insert(index: Integer; i: Integer): JStringBuffer; cdecl; overload;//Deprecated
    {class} function insert(index: Integer; l: Int64): JStringBuffer; cdecl; overload;//Deprecated
    {class} function insert(index: Integer; string_: JString): JStringBuffer; cdecl; overload;//Deprecated
    {class} function insert(index: Integer; chars: TJavaArray<Char>): JStringBuffer; cdecl; overload;//Deprecated
    {class} function insert(index: Integer; chars: TJavaArray<Char>; start: Integer; length: Integer): JStringBuffer; cdecl; overload;//Deprecated
    {class} function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;//Deprecated
    {class} function replace(start: Integer; end_: Integer; string_: JString): JStringBuffer; cdecl;//Deprecated
    {class} function reverse: JStringBuffer; cdecl;//Deprecated
    {class} function substring(start: Integer): JString; cdecl; overload;
    {class} function substring(start: Integer; end_: Integer): JString; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('java/lang/StringBuffer')]
  JStringBuffer = interface(JAbstractStringBuilder)
    ['{3CECFBBE-9C21-4D67-9F6F-52BB1DB2C638}']
    function append(b: Boolean): JStringBuffer; cdecl; overload;
    function append(i: Integer): JStringBuffer; cdecl; overload;
    function append(l: Int64): JStringBuffer; cdecl; overload;
    function append(obj: JObject): JStringBuffer; cdecl; overload;
    function append(chars: TJavaArray<Char>; start: Integer; length: Integer): JStringBuffer; cdecl; overload;
    function append(s: JCharSequence): JStringBuffer; cdecl; overload;
    function append(s: JCharSequence; start: Integer; end_: Integer): JStringBuffer; cdecl; overload;
    function codePointBefore(index: Integer): Integer; cdecl;//Deprecated
    function codePointCount(beginIndex: Integer; endIndex: Integer): Integer; cdecl;//Deprecated
    procedure getChars(start: Integer; end_: Integer; buffer: TJavaArray<Char>; idx: Integer); cdecl;//Deprecated
    function indexOf(subString: JString; start: Integer): Integer; cdecl;//Deprecated
    function insert(index: Integer; ch: Char): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; d: Double): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; f: Single): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; obj: JObject): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; s: JCharSequence): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; s: JCharSequence; start: Integer; end_: Integer): JStringBuffer; cdecl; overload;//Deprecated
    function lastIndexOf(subString: JString; start: Integer): Integer; cdecl;//Deprecated
    procedure setCharAt(index: Integer; ch: Char); cdecl;
    procedure setLength(length: Integer); cdecl;
    function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;
    procedure trimToSize; cdecl;
  end;
  TJStringBuffer = class(TJavaGenericImport<JStringBufferClass, JStringBuffer>) end;

  JStringBuilderClass = interface(JAbstractStringBuilderClass)
    ['{D9FACB66-EE60-4BCB-B5B2-248751CCF1B4}']
    {class} function init: JStringBuilder; cdecl; overload;
    {class} function init(capacity: Integer): JStringBuilder; cdecl; overload;
    {class} function init(seq: JCharSequence): JStringBuilder; cdecl; overload;
    {class} function init(str: JString): JStringBuilder; cdecl; overload;
    {class} function append(l: Int64): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(f: Single): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(d: Double): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(sb: JStringBuffer): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(chars: TJavaArray<Char>): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(str: TJavaArray<Char>; offset: Integer; len: Integer): JStringBuilder; cdecl; overload;//Deprecated
    {class} function delete(start: Integer; end_: Integer): JStringBuilder; cdecl;//Deprecated
    {class} function deleteCharAt(index: Integer): JStringBuilder; cdecl;//Deprecated
    {class} function insert(offset: Integer; b: Boolean): JStringBuilder; cdecl; overload;//Deprecated
    {class} function insert(offset: Integer; f: Single): JStringBuilder; cdecl; overload;
    {class} function insert(offset: Integer; d: Double): JStringBuilder; cdecl; overload;
    {class} function insert(offset: Integer; obj: JObject): JStringBuilder; cdecl; overload;
    {class} function insert(offset: Integer; s: JCharSequence): JStringBuilder; cdecl; overload;
    {class} function insert(offset: Integer; s: JCharSequence; start: Integer; end_: Integer): JStringBuilder; cdecl; overload;
    {class} function replace(start: Integer; end_: Integer; string_: JString): JStringBuilder; cdecl;
  end;

  [JavaSignature('java/lang/StringBuilder')]
  JStringBuilder = interface(JAbstractStringBuilder)
    ['{F8A75A66-EA10-4337-9ECC-B0CA4FF4D9C5}']
    function append(b: Boolean): JStringBuilder; cdecl; overload;//Deprecated
    function append(c: Char): JStringBuilder; cdecl; overload;//Deprecated
    function append(i: Integer): JStringBuilder; cdecl; overload;//Deprecated
    function append(obj: JObject): JStringBuilder; cdecl; overload;//Deprecated
    function append(str: JString): JStringBuilder; cdecl; overload;//Deprecated
    function append(csq: JCharSequence): JStringBuilder; cdecl; overload;//Deprecated
    function append(csq: JCharSequence; start: Integer; end_: Integer): JStringBuilder; cdecl; overload;//Deprecated
    function appendCodePoint(codePoint: Integer): JStringBuilder; cdecl;//Deprecated
    function insert(offset: Integer; c: Char): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; i: Integer): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; l: Int64): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; str: JString): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; ch: TJavaArray<Char>): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; str: TJavaArray<Char>; strOffset: Integer; strLen: Integer): JStringBuilder; cdecl; overload;
    function reverse: JStringBuilder; cdecl;
    function toString: JString; cdecl;
  end;
  TJStringBuilder = class(TJavaGenericImport<JStringBuilderClass, JStringBuilder>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Android.CieloLIO.JAnimator', TypeInfo(Android.CieloLIO.JAnimator));
  TRegTypes.RegisterType('Android.CieloLIO.JAnimator_AnimatorListener', TypeInfo(Android.CieloLIO.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('Android.CieloLIO.JAnimator_AnimatorPauseListener', TypeInfo(Android.CieloLIO.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('Android.CieloLIO.JKeyframe', TypeInfo(Android.CieloLIO.JKeyframe));
  TRegTypes.RegisterType('Android.CieloLIO.JLayoutTransition', TypeInfo(Android.CieloLIO.JLayoutTransition));
  TRegTypes.RegisterType('Android.CieloLIO.JLayoutTransition_TransitionListener', TypeInfo(Android.CieloLIO.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('Android.CieloLIO.JPropertyValuesHolder', TypeInfo(Android.CieloLIO.JPropertyValuesHolder));
  TRegTypes.RegisterType('Android.CieloLIO.JStateListAnimator', TypeInfo(Android.CieloLIO.JStateListAnimator));
  TRegTypes.RegisterType('Android.CieloLIO.JTimeInterpolator', TypeInfo(Android.CieloLIO.JTimeInterpolator));
  TRegTypes.RegisterType('Android.CieloLIO.JTypeConverter', TypeInfo(Android.CieloLIO.JTypeConverter));
  TRegTypes.RegisterType('Android.CieloLIO.JTypeEvaluator', TypeInfo(Android.CieloLIO.JTypeEvaluator));
  TRegTypes.RegisterType('Android.CieloLIO.JValueAnimator', TypeInfo(Android.CieloLIO.JValueAnimator));
  TRegTypes.RegisterType('Android.CieloLIO.JValueAnimator_AnimatorUpdateListener', TypeInfo(Android.CieloLIO.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('Android.CieloLIO.JPathMotion', TypeInfo(Android.CieloLIO.JPathMotion));
  TRegTypes.RegisterType('Android.CieloLIO.JScene', TypeInfo(Android.CieloLIO.JScene));
  TRegTypes.RegisterType('Android.CieloLIO.JTransition', TypeInfo(Android.CieloLIO.JTransition));
  TRegTypes.RegisterType('Android.CieloLIO.JTransition_EpicenterCallback', TypeInfo(Android.CieloLIO.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('Android.CieloLIO.JTransition_TransitionListener', TypeInfo(Android.CieloLIO.JTransition_TransitionListener));
  TRegTypes.RegisterType('Android.CieloLIO.JTransitionManager', TypeInfo(Android.CieloLIO.JTransitionManager));
  TRegTypes.RegisterType('Android.CieloLIO.JTransitionPropagation', TypeInfo(Android.CieloLIO.JTransitionPropagation));
  TRegTypes.RegisterType('Android.CieloLIO.JTransitionValues', TypeInfo(Android.CieloLIO.JTransitionValues));
  TRegTypes.RegisterType('Android.CieloLIO.JInterpolator', TypeInfo(Android.CieloLIO.JInterpolator));
  TRegTypes.RegisterType('Android.CieloLIO.JToolbar_LayoutParams', TypeInfo(Android.CieloLIO.JToolbar_LayoutParams));
  TRegTypes.RegisterType('Android.CieloLIO.JIRemoteOrderService', TypeInfo(Android.CieloLIO.JIRemoteOrderService));
  TRegTypes.RegisterType('Android.CieloLIO.JIRemoteOrderService_Stub', TypeInfo(Android.CieloLIO.JIRemoteOrderService_Stub));
  TRegTypes.RegisterType('Android.CieloLIO.JIRemoteOrderService_Stub_Proxy', TypeInfo(Android.CieloLIO.JIRemoteOrderService_Stub_Proxy));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableItem', TypeInfo(Android.CieloLIO.JParcelableItem));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableItem_Companion', TypeInfo(Android.CieloLIO.JParcelableItem_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableItem_Companion_CREATOR_1', TypeInfo(Android.CieloLIO.JParcelableItem_Companion_CREATOR_1));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableOrder', TypeInfo(Android.CieloLIO.JParcelableOrder));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableOrder_Companion', TypeInfo(Android.CieloLIO.JParcelableOrder_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableOrder_Companion_CREATOR_1', TypeInfo(Android.CieloLIO.JParcelableOrder_Companion_CREATOR_1));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableResultOrders', TypeInfo(Android.CieloLIO.JParcelableResultOrders));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableResultOrders_Companion', TypeInfo(Android.CieloLIO.JParcelableResultOrders_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JCREATOR_1', TypeInfo(Android.CieloLIO.JCREATOR_1));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableTransaction', TypeInfo(Android.CieloLIO.JParcelableTransaction));
  TRegTypes.RegisterType('Android.CieloLIO.JParcelableTransaction_Companion', TypeInfo(Android.CieloLIO.JParcelableTransaction_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JCompanion_CREATOR_1', TypeInfo(Android.CieloLIO.JCompanion_CREATOR_1));
  TRegTypes.RegisterType('Android.CieloLIO.Jdomain_Credentials', TypeInfo(Android.CieloLIO.Jdomain_Credentials));
  TRegTypes.RegisterType('Android.CieloLIO.JDeviceModel', TypeInfo(Android.CieloLIO.JDeviceModel));
  TRegTypes.RegisterType('Android.CieloLIO.Jdomain_Item', TypeInfo(Android.CieloLIO.Jdomain_Item));
  TRegTypes.RegisterType('Android.CieloLIO.JLauncherVersionCode', TypeInfo(Android.CieloLIO.JLauncherVersionCode));
  TRegTypes.RegisterType('Android.CieloLIO.JLauncherVersionCode_Companion', TypeInfo(Android.CieloLIO.JLauncherVersionCode_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JOrder', TypeInfo(Android.CieloLIO.JOrder));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderType', TypeInfo(Android.CieloLIO.JOrderType));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderType_Companion', TypeInfo(Android.CieloLIO.JOrderType_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JPrinterAttributes', TypeInfo(Android.CieloLIO.JPrinterAttributes));
  TRegTypes.RegisterType('Android.CieloLIO.JPrinterAttributes_Companion', TypeInfo(Android.CieloLIO.JPrinterAttributes_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JPurchase', TypeInfo(Android.CieloLIO.JPurchase));
  TRegTypes.RegisterType('Android.CieloLIO.JResultOrders', TypeInfo(Android.CieloLIO.JResultOrders));
  TRegTypes.RegisterType('Android.CieloLIO.Jdomain_Settings', TypeInfo(Android.CieloLIO.Jdomain_Settings));
  TRegTypes.RegisterType('Android.CieloLIO.JSettings_Companion', TypeInfo(Android.CieloLIO.JSettings_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.Jdomain_Status', TypeInfo(Android.CieloLIO.Jdomain_Status));
  TRegTypes.RegisterType('Android.CieloLIO.JV40Code', TypeInfo(Android.CieloLIO.JV40Code));
  TRegTypes.RegisterType('Android.CieloLIO.JV40Code_Companion', TypeInfo(Android.CieloLIO.JV40Code_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JPrimaryProductExtensionKt', TypeInfo(Android.CieloLIO.JPrimaryProductExtensionKt));
  TRegTypes.RegisterType('Android.CieloLIO.JSettingsExtensionKt', TypeInfo(Android.CieloLIO.JSettingsExtensionKt));
  TRegTypes.RegisterType('Android.CieloLIO.JPrimaryProduct', TypeInfo(Android.CieloLIO.JPrimaryProduct));
  TRegTypes.RegisterType('Android.CieloLIO.JProductsColumnsNames', TypeInfo(Android.CieloLIO.JProductsColumnsNames));
  TRegTypes.RegisterType('Android.CieloLIO.JProductsColumnsNames_Companion', TypeInfo(Android.CieloLIO.JProductsColumnsNames_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JSecondaryProduct', TypeInfo(Android.CieloLIO.JSecondaryProduct));
  TRegTypes.RegisterType('Android.CieloLIO.JInfoManager', TypeInfo(Android.CieloLIO.JInfoManager));
  TRegTypes.RegisterType('Android.CieloLIO.JBaseOrderManager', TypeInfo(Android.CieloLIO.JBaseOrderManager));
  TRegTypes.RegisterType('Android.CieloLIO.JBaseOrderManager_DefaultImpls', TypeInfo(Android.CieloLIO.JBaseOrderManager_DefaultImpls));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManager', TypeInfo(Android.CieloLIO.JOrderManager));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManager_Companion', TypeInfo(Android.CieloLIO.JOrderManager_Companion));
  TRegTypes.RegisterType('Android.CieloLIO.JPrinterListener', TypeInfo(Android.CieloLIO.JPrinterListener));
  TRegTypes.RegisterType('Android.CieloLIO.JPurchaseValidationListener', TypeInfo(Android.CieloLIO.JPurchaseValidationListener));
  TRegTypes.RegisterType('Android.CieloLIO.JServiceBindListener', TypeInfo(Android.CieloLIO.JServiceBindListener));
  TRegTypes.RegisterType('Android.CieloLIO.JCanceledPayment', TypeInfo(Android.CieloLIO.JCanceledPayment));
  //TRegTypes.RegisterType('Android.CieloLIO.Jtype_1', TypeInfo(Android.CieloLIO.Jtype_1));
  TRegTypes.RegisterType('Android.CieloLIO.JCancellationListener', TypeInfo(Android.CieloLIO.JCancellationListener));
  TRegTypes.RegisterType('Android.CieloLIO.JPayment', TypeInfo(Android.CieloLIO.JPayment));
  //TRegTypes.RegisterType('Android.CieloLIO.JPayment_type_1', TypeInfo(Android.CieloLIO.JPayment_type_1));
  TRegTypes.RegisterType('Android.CieloLIO.JPaymentCode', TypeInfo(Android.CieloLIO.JPaymentCode));
  TRegTypes.RegisterType('Android.CieloLIO.JPaymentError', TypeInfo(Android.CieloLIO.JPaymentError));
  TRegTypes.RegisterType('Android.CieloLIO.JPaymentListener', TypeInfo(Android.CieloLIO.JPaymentListener));
  TRegTypes.RegisterType('Android.CieloLIO.JPaymentMethod', TypeInfo(Android.CieloLIO.JPaymentMethod));
  TRegTypes.RegisterType('Android.CieloLIO.JExtensionsKt', TypeInfo(Android.CieloLIO.JExtensionsKt));
  TRegTypes.RegisterType('Android.CieloLIO.JSdkUtilsKt', TypeInfo(Android.CieloLIO.JSdkUtilsKt));
  TRegTypes.RegisterType('Android.CieloLIO.JSdkUtilsKt_WhenMappings', TypeInfo(Android.CieloLIO.JSdkUtilsKt_WhenMappings));
  TRegTypes.RegisterType('Android.CieloLIO.Jutils_SecureRandom', TypeInfo(Android.CieloLIO.Jutils_SecureRandom));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv1', TypeInfo(Android.CieloLIO.JOrderManagerImplv1));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv1_CancellationBroadcastReceiver', TypeInfo(Android.CieloLIO.JOrderManagerImplv1_CancellationBroadcastReceiver));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv1_PaymentBroadcastReceiver', TypeInfo(Android.CieloLIO.JOrderManagerImplv1_PaymentBroadcastReceiver));
  //TRegTypes.RegisterType('Android.CieloLIO.Jbind_1', TypeInfo(Android.CieloLIO.Jbind_1));
  //TRegTypes.RegisterType('Android.CieloLIO.Jbind_2', TypeInfo(Android.CieloLIO.Jbind_2));
  TRegTypes.RegisterType('Android.CieloLIO.JsortedByDescending_1', TypeInfo(Android.CieloLIO.JsortedByDescending_1));
  TRegTypes.RegisterType('Android.CieloLIO.JserviceConnection_1', TypeInfo(Android.CieloLIO.JserviceConnection_1));
  //TRegTypes.RegisterType('Android.CieloLIO.JvalidateCredentials_1', TypeInfo(Android.CieloLIO.JvalidateCredentials_1));
  //TRegTypes.RegisterType('Android.CieloLIO.JvalidateCredentials_2', TypeInfo(Android.CieloLIO.JvalidateCredentials_2));
  //TRegTypes.RegisterType('Android.CieloLIO.JokHttpClient_1', TypeInfo(Android.CieloLIO.JokHttpClient_1));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv2', TypeInfo(Android.CieloLIO.JOrderManagerImplv2));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv3', TypeInfo(Android.CieloLIO.JOrderManagerImplv3));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv4', TypeInfo(Android.CieloLIO.JOrderManagerImplv4));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv5', TypeInfo(Android.CieloLIO.JOrderManagerImplv5));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv6', TypeInfo(Android.CieloLIO.JOrderManagerImplv6));
  TRegTypes.RegisterType('Android.CieloLIO.JOrderManagerImplv7', TypeInfo(Android.CieloLIO.JOrderManagerImplv7));
  TRegTypes.RegisterType('Android.CieloLIO.Jordermanager_BuildConfig', TypeInfo(Android.CieloLIO.Jordermanager_BuildConfig));
  TRegTypes.RegisterType('Android.CieloLIO.JPrinterManager', TypeInfo(Android.CieloLIO.JPrinterManager));
  //TRegTypes.RegisterType('Android.CieloLIO.JconfigPrinterListener_1', TypeInfo(Android.CieloLIO.JconfigPrinterListener_1));
  TRegTypes.RegisterType('Android.CieloLIO.JAccessTokenManagementApi', TypeInfo(Android.CieloLIO.JAccessTokenManagementApi));
  TRegTypes.RegisterType('Android.CieloLIO.JPurchaseApi', TypeInfo(Android.CieloLIO.JPurchaseApi));
  TRegTypes.RegisterType('Android.CieloLIO.Jentity_ApplicationInfo', TypeInfo(Android.CieloLIO.Jentity_ApplicationInfo));
  TRegTypes.RegisterType('Android.CieloLIO.JAbstractStringBuilder', TypeInfo(Android.CieloLIO.JAbstractStringBuilder));
  TRegTypes.RegisterType('Android.CieloLIO.JStringBuffer', TypeInfo(Android.CieloLIO.JStringBuffer));
  TRegTypes.RegisterType('Android.CieloLIO.JStringBuilder', TypeInfo(Android.CieloLIO.JStringBuilder));
end;

initialization
  RegisterTypes;
end.

