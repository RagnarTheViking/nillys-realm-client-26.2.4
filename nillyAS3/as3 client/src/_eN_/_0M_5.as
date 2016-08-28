package _eN_
{
   import flash.display.DisplayObject;
   import _0Q_5.URLAssetBase;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import _0Q_5.URLAsset;
   
   public class _0M_5
   {
      
      public static var _0M_y:Class = _0Z_c;
       
      
      public var _id:String;
      
      public var _title:String;
      
      private var _0D_a:String;
      
      public var _N_D_:String;
      
      public var _K_V_:String;
      
      private var _1zb:String;
      
      private var _178:String;
      
      private var _0O_j:String;
      
      public var _0__G_:String;
      
      private var _0eL_:DisplayObject;
      
      public var _15S_:String;
      
      private var _028:DisplayObject;
      
      public var _0V_I_:Date;
      
      public var _1do:Date;
      
      private var _loader:URLAssetBase;
      
      private var _1a2:URLAssetBase;
      
      public var _wJ_:Vector.<Vector.<int>>;
      
      public var _1__e:Vector.<int>;
      
      public function _0M_5()
      {
         this._loader = new URLAsset();
         this._1a2 = new URLAsset();
         this._wJ_ = new Vector.<Vector.<int>>();
         this._1__e = new Vector.<int>();
         super();
      }
      
      public function get id() : *
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get title() : *
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
      }
      
      public function get description() : *
      {
         return this._0D_a;
      }
      
      public function set description(param1:String) : void
      {
         this._0D_a = param1;
      }
      
      public function get weight() : *
      {
         return this._N_D_;
      }
      
      public function set weight(param1:String) : void
      {
         this._N_D_ = param1;
      }
      
      public function get _0j2() : *
      {
         return this._K_V_;
      }
      
      public function set _0j2(param1:String) : void
      {
         this._K_V_ = param1;
      }
      
      public function get _1k7() : String
      {
         return this._1zb;
      }
      
      public function set _1k7(param1:String) : void
      {
         this._1zb = param1;
      }
      
      public function get _qL_() : String
      {
         return this._178;
      }
      
      public function set _qL_(param1:String) : void
      {
         this._178 = param1;
      }
      
      public function get _0pY_() : String
      {
         return this._0O_j;
      }
      
      public function set _0pY_(param1:String) : void
      {
         this._0O_j = param1;
      }
      
      public function get _09I_() : *
      {
         return this._0__G_;
      }
      
      public function set _09I_(param1:String) : void
      {
         this._0__G_ = param1;
         this._188(this._0__G_);
      }
      
      private function _188(param1:String) : void
      {
         this._loader && this._loader.unload();
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._B_H_);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.DISK_ERROR,this._B_H_);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR,this._B_H_);
         this._loader.load(new URLRequest(param1));
      }
      
      private function _B_H_(param1:IOErrorEvent) : void
      {
         this._0eL_ = new _0M_y();
      }
      
      private function onComplete(param1:Event) : void
      {
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onComplete);
         this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this._B_H_);
         this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.DISK_ERROR,this._B_H_);
         this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.NETWORK_ERROR,this._B_H_);
         this._0eL_ = DisplayObject(this._loader);
      }
      
      public function get _H_A_() : DisplayObject
      {
         return this._0eL_;
      }
      
      public function get _0jC_() : *
      {
         return this._15S_;
      }
      
      public function set _0jC_(param1:String) : void
      {
         this._15S_ = param1;
         this._1C_y(this._15S_);
      }
      
      private function _1C_y(param1:String) : void
      {
         this._1g2(param1,this._1a2);
      }
      
      private function _1g2(param1:String, param2:URLAssetBase) : void
      {
         param2 && param2.unload();
         param2.contentLoaderInfo.addEventListener(Event.COMPLETE,this._8a);
         param2.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._1W_z);
         param2.contentLoaderInfo.addEventListener(IOErrorEvent.DISK_ERROR,this._1W_z);
         param2.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR,this._1W_z);
         param2.load(new URLRequest(param1));
      }
      
      private function _1W_z(param1:IOErrorEvent) : void
      {
      }
      
      private function _8a(param1:Event) : void
      {
         this._1a2.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._8a);
         this._1a2.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this._1W_z);
         this._1a2.contentLoaderInfo.removeEventListener(IOErrorEvent.DISK_ERROR,this._1W_z);
         this._1a2.contentLoaderInfo.removeEventListener(IOErrorEvent.NETWORK_ERROR,this._1W_z);
         this._028 = DisplayObject(this._1a2);
      }
      
      public function get startTime() : *
      {
         return this._0V_I_;
      }
      
      public function set startTime(param1:Date) : void
      {
         this._0V_I_ = param1;
      }
      
      public function get endTime() : *
      {
         return this._1do;
      }
      
      public function set endTime(param1:Date) : void
      {
         this._1do = param1;
      }
      
      public function _0iO_() : void
      {
         var _loc1_:String = null;
         var _loc2_:Vector.<int> = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = this._K_V_.split(";");
         var _loc6_:Dictionary = new Dictionary();
         for each(_loc1_ in _loc5_)
         {
            _loc2_ = new Vector.<int>();
            _loc3_ = _loc1_.split(",");
            for each(_loc4_ in _loc3_)
            {
               if(_loc6_[int(_loc4_)] == null)
               {
                  _loc6_[int(_loc4_)] = true;
                  this._1__e.push(int(_loc4_));
               }
               _loc2_.push(int(_loc4_));
            }
            this._wJ_.push(_loc2_);
         }
      }
      
      public function get _3s() : DisplayObject
      {
         return this._028;
      }
      
      public function set _3s(param1:DisplayObject) : void
      {
         this._028 = param1;
      }
      
      public function get loader() : URLAssetBase
      {
         return this._loader;
      }
      
      public function set loader(param1:URLAssetBase) : void
      {
         this._loader = param1;
      }
      
      public function get _P_6() : URLAssetBase
      {
         return this._1a2;
      }
      
      public function set _P_6(param1:URLAssetBase) : void
      {
         this._1a2 = param1;
      }
   }
}
