package _V_E_
{
   import _1__8.IConfig;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.util._A_o;
   import _wi.Injector;
   import com.company.assembleegameclient.util._01D_;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import _0sx._0F_U_;
   import _0sx._0jf;
   import _0sx._0__8;
   import _0cW_.Screen3DHelper;
   import flash.display3D.Context3DBlendFactor;
   import flash.display3D.Context3DCompareMode;
   import _0sx.Graphic3DHelper;
   import com.company.assembleegameclient.engine3d._1aW_;
   
   public class Screen3D implements IConfig
   {
      
      public static var Width:Number = 600;
      
      public static var HalfWidth:Number = Width / 2;
      
      public static var Height:Number = 600;
      
      public static var HalfHeight:Number = Height / 2;
       
      
      [Inject]
      public var _1gH_:_A_o;
      
      [Inject]
      public var _T_X_:Injector;
      
      public var _1G_9:_V_E_.R3D;
      
      private var stage3D:_01D_;
      
      public function Screen3D()
      {
         super();
      }
      
      public static function resetDimensions() : *
      {
         var _loc1_:Number = Parameters.data_["mscale"];
         var _loc2_:Number = WebMain.sWidth / _loc1_;
         var _loc3_:Number = WebMain.sHeight / _loc1_;
         Width = _loc2_;
         HalfWidth = _loc2_ / 2;
         Height = _loc3_;
         HalfHeight = _loc3_ / 2;
      }
      
      public function configure() : void
      {
         this._0vI_();
         this.stage3D = this._1gH_.getStage3Ds(0);
         this.stage3D.addEventListener(ErrorEvent.ERROR,Parameters._1K_3);
         this.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.create);
         this.stage3D.requestContext3D();
      }
      
      private function _0vI_() : void
      {
         this._T_X_.map(_1Z_O_).asSingleton();
         this._T_X_.map(_0F_U_).asSingleton();
         this._T_X_.map(_0jf).asSingleton();
         this._T_X_.map(_0__8).asSingleton();
      }
      
      private function create(param1:Event) : void
      {
         this.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.create);
         var _loc2_:Screen3DHelper = this.stage3D.getContext3D();
         if(_loc2_.getContext().driverInfo.toLowerCase().indexOf("software") != -1)
         {
            Parameters.disableHardwareAccel();
         }
         _loc2_.configureBackBuffer(Width,Height,2,true);
         _loc2_.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
         _loc2_.setDepthTest(false,Context3DCompareMode.LESS_EQUAL);
         this._T_X_.map(Screen3DHelper)._1as(_loc2_);
         Graphic3DHelper.map(this._T_X_);
         this._1G_9 = this._T_X_.getInstance(_V_E_.R3D);
         this._1G_9.init(_loc2_.getContext());
         _1aW_._lC_(_loc2_.getContext());
      }
   }
}
