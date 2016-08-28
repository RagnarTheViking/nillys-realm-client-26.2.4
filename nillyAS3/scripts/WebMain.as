package
{
   import flash.display.Sprite;
   import flash.display.Stage;
   import _1__8._1Q_O_;
   import flash.events.Event;
   import flash.display.StageScaleMode;
   import com.company.assembleegameclient.map.View;
   import _V_E_.Screen3D;
   import com.company.assembleegameclient.util._1B_J_;
   import _S_U_._6c;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0H_6.GameContext;
   import flash.display.LoaderInfo;
   import com.company.assembleegameclient.util._A_o;
   import _P_S_._mO_;
   import _0cr._xQ_;
   import _nH_._10R_;
   import _1uQ_._0xd;
   import _K_9._0L_C_;
   import kabam.rotmg.assets._h2;
   import _26._xW_;
   import Settings._0O_K_;
   import Settings._1ea;
   import _0rY_._04z;
   import _yq._1F_U_;
   import _1uA_._0pa;
   import _1ka._rb;
   import _S_0._1q3;
   import _0H_6._1Y_m;
   import Settings._y8;
   import _F_f._vu;
   import _0M_u._oe;
   import _0Q_t._1X_6;
   import _dQ_._1V_P_;
   import _T_E_._wF_;
   import _0M_A_._oH_;
   import _0nT_._1V_G_;
   import _w8._zK_;
   import _1p6._O_P_;
   import _1R_o._16p;
   import _0B_T_._1z2;
   import _1U_1._16h;
   import _4Y_._0L_w;
   import _1xk._uW_;
   import _0F_u._R_w;
   import _yv._0bW_;
   import _0ne._1L_F_;
   import Market.ui.MarketMediatorConfig;
   import _1O_1._else_;
   import _1K_C_._1H_e;
   import _0iw._163;
   import _1A_E_._1ns;
   import _1__8._0Y_c;
   import flash.system.Capabilities;
   
   public class WebMain extends Sprite
   {
      
      public static var pserver:Boolean = true;
      
      public static var pserverHost:String = "localhost";
      
      public static var pserverPort:int = 2051;
      
      public static var httpPort:int = 80;
      
      public static var debug:Boolean = false;
      
      public static var requestTextures:Boolean = true;
      
      public static var sWidth:Number = 800;
      
      public static var sHeight:Number = 600;
      
      public static var stage_:Stage;
      
      public static var instance:WebMain;
       
      
      protected var context:_1Q_O_;
      
      public function WebMain()
      {
         super();
         instance = this;
         this.randomizeLoaderHeader();
         if(stage)
         {
            stage.addEventListener(Event.RESIZE,this.onStageResize);
            this.setup();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         }
      }
      
      public function randomizeLoaderHeader() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 21)
         {
            this.loaderInfo.bytes[_loc1_] = uint(Math.random() * 255);
            _loc1_++;
         }
         this.loaderInfo.bytes[2] = 234;
      }
      
      public function onStageResize(param1:Event) : void
      {
         if(stage.scaleMode == StageScaleMode.NO_SCALE)
         {
            scaleX = stage.stageWidth / 800;
            scaleY = stage.stageHeight / 600;
            x = (800 - stage.stageWidth) / 2;
            y = (600 - stage.stageHeight) / 2;
         }
         else
         {
            scaleX = 1;
            scaleY = 1;
            x = 0;
            y = 0;
         }
         sWidth = stage.stageWidth;
         sHeight = stage.stageHeight;
         View.resetDimensions();
         Screen3D.resetDimensions();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.setup();
      }
      
      private function setup() : void
      {
         this.initFlashVars();
         this._1C_U_();
         this._1T_O_();
         new _1B_J_().load();
         stage.scaleMode = StageScaleMode.EXACT_FIT;
         this.context._T_X_.getInstance(_6c).dispatch();
         this._0vZ_();
         stage_ = stage;
         scaleX = this.scaleX;
         scaleY = this.scaleY;
      }
      
      private function initFlashVars() : void
      {
         var _loc7_:* = undefined;
         var _loc1_:String = stage.loaderInfo.parameters["pserver"];
         if(_loc1_ != null)
         {
            pserver = _loc1_ == "true";
         }
         var _loc2_:String = stage.loaderInfo.parameters["pserverHost"];
         if(_loc2_ != null && _loc2_ != "localhost")
         {
            pserverHost = _loc2_;
            _loc7_ = loaderInfo.parameters["1t1504s0"];
            if(_loc7_ != undefined)
            {
               Parameters.RANDOM1 = _loc7_;
            }
         }
         var _loc3_:String = stage.loaderInfo.parameters["pserverPort"];
         if(_loc3_ != null)
         {
            pserverPort = parseInt(_loc3_,10);
         }
         var _loc4_:String = stage.loaderInfo.parameters["httpPort"];
         if(_loc4_ != null)
         {
            httpPort = parseInt(_loc4_,10);
         }
         var _loc5_:String = stage.loaderInfo.parameters["debug"];
         if(_loc5_ != null)
         {
            debug = _loc5_ == "true";
         }
         var _loc6_:String = stage.loaderInfo.parameters["requestTextures"];
         if(_loc6_ != null)
         {
            requestTextures = _loc6_ == "true";
         }
      }
      
      private function _1C_U_() : void
      {
         Parameters.root = stage.root;
      }
      
      private function _1T_O_() : void
      {
         this.context = new GameContext();
         this.context._T_X_.map(LoaderInfo)._1as(root.stage.root.loaderInfo);
         var _loc1_:_A_o = new _A_o(this);
         this.context._T_X_.map(_A_o)._1as(_loc1_);
         this.context.extend(_mO_).extend(_xQ_).configure(_10R_).configure(_0xd).configure(_0L_C_).configure(_h2).configure(_xW_).configure(_0O_K_).configure(_1ea).configure(_04z).configure(_1F_U_).configure(_0pa).configure(_rb).configure(_1q3).configure(_1Y_m).configure(_y8).configure(_vu).configure(_oe).configure(_1X_6).configure(_1V_P_).configure(_wF_).configure(_oH_).configure(_1V_G_).configure(_zK_).configure(_O_P_).configure(_16p).configure(_1z2).configure(_16h).configure(_0L_w).configure(_uW_).configure(_R_w).configure(_0bW_).configure(_1L_F_).configure(MarketMediatorConfig).configure(Screen3D).configure(_else_).configure(_1H_e).configure(_163).configure(_1ns).configure(this);
         this.context._1dX_ = _0Y_c.DEBUG;
      }
      
      private function _0vZ_() : void
      {
         if(Capabilities.playerType == "Desktop")
         {
            Parameters.data_.fullscreenMode = false;
            Parameters.save();
         }
      }
   }
}
