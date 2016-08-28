package _0u4
{
   import flash.display.Sprite;
   import _0C_2._17f;
   import _0U_p._0T_r;
   import _1__8._19A_;
   import _f7.Signal;
   import flash.display.Loader;
   import flash.system.Security;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class _ow extends Sprite implements _0us
   {
       
      
      [Inject]
      public var local:_17f;
      
      [Inject]
      public var _1T_C_:_0T_r;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var _0A_1:Signal;
      
      private var _01q:Signal;
      
      private var loader:Loader;
      
      private var _1iN_;
      
      public function _ow()
      {
         super();
         this._0A_1 = new Signal();
         this._01q = new Signal(Object);
      }
      
      public function load(param1:String) : void
      {
         Security.allowDomain(param1);
         this._0G_2.info("kongregate api loading");
         addChild(this.loader = new Loader());
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._1ll);
         this.loader.load(new URLRequest(param1));
      }
      
      private function _1ll(param1:Event) : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._1ll);
         this._1iN_ = param1.target.content;
         this._1iN_.services.connect();
         this._M_x();
         this._1K_O_.dispatch();
         this._0G_2.info("kongregate api loaded");
      }
      
      private function _M_x() : void
      {
         if(this._1iN_.services.isGuest())
         {
            this._0G_2.info("kongregate guest detected - listening for external login");
            this._1iN_.services.addEventListener("login",this._1ec);
         }
      }
      
      private function _1ec(param1:Event) : void
      {
         this._0G_2.info("external login from kongregate detected");
         this._1T_C_.dispatch();
      }
      
      public function get _1K_O_() : Signal
      {
         return this._0A_1;
      }
      
      public function _1C_t() : void
      {
         this._0G_2.info("showRegistrationBox request sent to kongregate");
         this._1iN_.services.showRegistrationBox();
      }
      
      public function isGuest() : Boolean
      {
         return this._1iN_.services.isGuest();
      }
      
      public function _11f() : Object
      {
         var _loc1_:Object = {};
         _loc1_.userId = this._1iN_.services.getUserId();
         _loc1_.username = this._1iN_.services.getUsername();
         _loc1_.gameAuthToken = this._1iN_.services.getGameAuthToken();
         return _loc1_;
      }
      
      public function _1P_s(param1:String, param2:int) : void
      {
         this._1iN_.stats.submit(param1,param2);
      }
      
      public function _1yb() : String
      {
         return this._1iN_.services.getUsername();
      }
      
      public function getUserId() : String
      {
         return this._1iN_.services.getUserId();
      }
      
      public function purchaseItems(param1:Object) : void
      {
         this._1iN_.mtx.purchaseItems([param1],this._N_Y_);
      }
      
      private function _N_Y_(param1:Object) : void
      {
         this._01q.dispatch(param1);
      }
      
      public function get _E_W_() : Signal
      {
         return this._01q;
      }
   }
}
