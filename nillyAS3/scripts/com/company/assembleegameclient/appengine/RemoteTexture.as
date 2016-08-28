package com.company.assembleegameclient.appengine
{
   import _1__8._19A_;
   import _0gX_._gw;
   import _0rQ_._Z_W_;
   import _aW_._K_Y_;
   import flash.net.URLLoaderDataFormat;
   import flash.utils.ByteArray;
   import _c8._S_n;
   import flash.display.BitmapData;
   import _0H_6.GameContext;
   import _wi.Injector;
   
   public class RemoteTexture
   {
      
      private static const _S_o:String = "http://{DOMAIN}/picture/get";
      
      private static const _md:String = "Remote Texture Error: {ERROR} (id:{ID}, instance:{INSTANCE})";
      
      private static const _1yW_:int = int(new Date().getTime());
       
      
      public var id_:String;
      
      public var _1U_m:String;
      
      public var callback_:Function;
      
      private var _0G_2:_19A_;
      
      public function RemoteTexture(param1:String, param2:String, param3:Function)
      {
         super();
         this.id_ = param1;
         this._1U_m = param2;
         this.callback_ = param3;
         var _loc4_:Injector = GameContext.getInjector();
         this._0G_2 = _loc4_.getInstance(_19A_);
      }
      
      public function run() : void
      {
         var _loc1_:String = !!WebMain.pserver?_gw._1fi.substr(7):this._1U_m == "testing"?"rotmgtesting.appspot.com":"realmofthemadgod.appspot.com";
         var _loc2_:String = _S_o.replace("{DOMAIN}",_loc1_);
         var _loc3_:Object = {};
         _loc3_.id = this.id_;
         _loc3_.time = _1yW_;
         var _loc4_:_K_Y_ = new _Z_W_();
         _loc4_._gP_(URLLoaderDataFormat.BINARY);
         _loc4_.complete.addOnce(this.onComplete);
         _loc4_.sendRequest(_loc2_,_loc3_);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._uc(param2);
         }
         else
         {
            this.reportError(param2);
         }
      }
      
      public function _uc(param1:ByteArray) : void
      {
         var _loc2_:BitmapData = _S_n._0Y_R_(param1);
         this.callback_(_loc2_);
      }
      
      public function reportError(param1:String) : void
      {
         param1 = _md.replace("{ERROR}",param1).replace("{ID}",this.id_).replace("{INSTANCE}",this._1U_m);
         this._0G_2._0G_b("RemoteTexture.reportError: {0}",[param1]);
         var _loc2_:BitmapData = new _1wr(1,1);
         this.callback_(_loc2_);
      }
   }
}
