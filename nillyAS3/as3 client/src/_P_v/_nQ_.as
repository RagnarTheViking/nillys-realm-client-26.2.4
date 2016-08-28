package _P_v
{
   import flash.display.Sprite;
   import _1R_9._J_m;
   import _f7.Signal;
   import _1__8._19A_;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   import _f7._0K_8;
   
   public class _nQ_ extends Sprite implements _J_m
   {
       
      
      private const _0A_1:Signal = new Signal();
      
      private const _1N_7:Signal = new Signal(Boolean);
      
      private const _0I_o:Signal = new Signal(uint,String,Boolean);
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var loader:Loader;
      
      private var _1iN_;
      
      private var _nI_:String;
      
      private var _qt:String;
      
      public function _nQ_()
      {
         super();
      }
      
      public function load(param1:String) : void
      {
         this._0G_2.info("LiveSteamApi load");
         addChild(this.loader = new Loader());
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._1ll);
         this.loader.load(new URLRequest(param1));
      }
      
      private function _1ll(param1:Event) : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._1ll);
         this._1iN_ = param1.target.content;
         this._1iN_.addEventListener("STEAM_MICRO_TXN_AUTH",this._0T_w);
         this._1K_O_.dispatch();
      }
      
      private function _0T_w(param1:*) : void
      {
         this._0G_2.debug("LiveSteamApi onSteamMicroTxnAuthEvent: {0}",[this._qt]);
         var _loc2_:uint = uint(param1.appID);
         var _loc3_:String = String(param1.orderID);
         var _loc4_:Boolean = Boolean(param1.isAuthorized);
         this._0I_o.dispatch(_loc2_,_loc3_,_loc4_);
      }
      
      public function requestSessionTicket() : void
      {
         this._0G_2.debug("LiveSteamApi requestSessionTicket");
         this._1iN_.requestSessionTicket(this._0sE_);
      }
      
      private function _0sE_(param1:String) : void
      {
         var _loc2_:* = param1 != null;
         _loc2_ && (this._qt = param1);
         this._0G_2.debug("LiveSteamApi sessionTicket: {0}",[this._qt]);
         this._0W_R_.dispatch(_loc2_);
      }
      
      public function _K_v() : Object
      {
         var _loc1_:Object = {};
         _loc1_.steamid = this._nI_ = this._nI_ || this._1iN_.getSteamID();
         _loc1_.sessionticket = this._qt;
         return _loc1_;
      }
      
      public function _0mw() : String
      {
         return this._1iN_.getSteamID();
      }
      
      public function _1P_s(param1:String, param2:int) : void
      {
         this._1iN_.setStatFromInt(param1,param2);
      }
      
      public function get _1K_O_() : Signal
      {
         return this._0A_1;
      }
      
      public function get _0W_R_() : Signal
      {
         return this._1N_7;
      }
      
      public function get _1R_E_() : _0K_8
      {
         return this._0I_o;
      }
      
      public function getPersonaName() : String
      {
         return this._1iN_.getPersonaName();
      }
   }
}
