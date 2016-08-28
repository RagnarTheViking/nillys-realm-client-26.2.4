package _0ib
{
   import _1wl._1H_v;
   import flash.geom.Rectangle;
   import _1wl._U_j;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import flash.system.System;
   import _2F_.Console;
   
   public class _0i1 extends _05E_
   {
       
      
      private var _1fB_:Array;
      
      private var _07b:Object;
      
      private var _95:_1H_v;
      
      private var _1j6:_1H_v;
      
      private var _0iI_:Boolean;
      
      private var _05__:Number = -1;
      
      public function _0i1(param1:Console)
      {
         var m:Console = param1;
         this._1fB_ = [];
         this._07b = {};
         super(m);
         remoter.registerCallback("fps",function(param1:ByteArray):void
         {
            fpsMonitor = param1.readBoolean();
         });
         remoter.registerCallback("mem",function(param1:ByteArray):void
         {
            memoryMonitor = param1.readBoolean();
         });
         remoter.registerCallback("removeGroup",function(param1:ByteArray):void
         {
            removeGroup(param1.readUTF());
         });
         remoter.registerCallback("graph",this._0cb,true);
      }
      
      public function add(param1:String, param2:Object, param3:String, param4:Number = -1, param5:String = null, param6:Rectangle = null, param7:Boolean = false) : void
      {
         var newGroup:Boolean = false;
         var i:_U_j = null;
         var n:String = param1;
         var obj:Object = param2;
         var prop:String = param3;
         var col:Number = param4;
         var key:String = param5;
         var rect:Rectangle = param6;
         var inverse:Boolean = param7;
         if(obj == null)
         {
            report("ERROR: Graph [" + n + "] received a null object to graph property [" + prop + "].",10);
            return;
         }
         var group:_1H_v = this._07b[n];
         if(!group)
         {
            newGroup = true;
            group = new _1H_v(n);
         }
         var interests:Array = group.interests;
         if(isNaN(col) || col < 0)
         {
            if(interests.length <= 5)
            {
               col = config.style["priority" + (10 - interests.length * 2)];
            }
            else
            {
               col = Math.random() * 16777215;
            }
         }
         if(key == null)
         {
            key = prop;
         }
         for each(i in interests)
         {
            if(i.key == key)
            {
               report("Graph with key [" + key + "] already exists in [" + n + "]",10);
               return;
            }
         }
         if(rect)
         {
            group.rect = rect;
         }
         if(inverse)
         {
            group._14u = inverse;
         }
         var interest:_U_j = new _U_j(key,col);
         var v:Number = NaN;
         try
         {
            v = interest.setObject(obj,prop);
         }
         catch(e:Error)
         {
            report("Error with graph value for [" + key + "] in [" + n + "]. " + e,10);
            return;
         }
         if(isNaN(v))
         {
            report("Graph value for key [" + key + "] in [" + n + "] is not a number (NaN).",10);
         }
         else
         {
            group.interests.push(interest);
            if(newGroup)
            {
               this._07b[n] = group;
               this._1fB_.push(group);
            }
         }
      }
      
      public function _1xP_(param1:String, param2:Number = NaN, param3:Number = NaN) : void
      {
         var _loc4_:_1H_v = this._07b[param1];
         if(!_loc4_)
         {
            return;
         }
         _loc4_.low = param2;
         _loc4_._k4 = param3;
         _loc4_.fixed = !(isNaN(param2) || isNaN(param3));
      }
      
      public function remove(param1:String, param2:Object = null, param3:String = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:_U_j = null;
         if(param2 == null && param3 == null)
         {
            this.removeGroup(param1);
         }
         else if(this._07b[param1])
         {
            _loc4_ = this._07b[param1].interests;
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               _loc6_ = _loc4_[_loc5_];
               if((param2 == null || _loc6_.obj == param2) && (param3 == null || _loc6_.prop == param3))
               {
                  _loc4_.splice(_loc5_,1);
               }
               _loc5_--;
            }
            if(_loc4_.length == 0)
            {
               this.removeGroup(param1);
            }
         }
      }
      
      private function removeGroup(param1:String) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:_1H_v = null;
         var _loc4_:int = 0;
         if(remoter.remoting == _0B_2._1X_3)
         {
            _loc2_ = new ByteArray();
            _loc2_.writeUTF(param1);
            remoter.send("removeGroup",_loc2_);
         }
         else
         {
            _loc3_ = this._07b[param1];
            _loc4_ = this._1fB_.indexOf(_loc3_);
            if(_loc4_ >= 0)
            {
               this._1fB_.splice(_loc4_,1);
            }
            delete this._07b[param1];
         }
      }
      
      public function get fpsMonitor() : Boolean
      {
         if(remoter.remoting == _0B_2._1X_3)
         {
            return console.panels.fpsMonitor;
         }
         return this._95 != null;
      }
      
      public function set fpsMonitor(param1:Boolean) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:int = 0;
         if(remoter.remoting == _0B_2._1X_3)
         {
            _loc2_ = new ByteArray();
            _loc2_.writeBoolean(param1);
            remoter.send("fps",_loc2_);
         }
         else if(param1 != this.fpsMonitor)
         {
            if(param1)
            {
               this._95 = this._1M___(_1H_v._1C_F_);
               this._95.low = 0;
               this._95.fixed = true;
               this._95._1kl = 30;
            }
            else
            {
               this._05__ = -1;
               _loc3_ = this._1fB_.indexOf(this._95);
               if(_loc3_ >= 0)
               {
                  this._1fB_.splice(_loc3_,1);
               }
               this._95 = null;
            }
            console.panels.mainPanel.updateMenu();
         }
      }
      
      public function get memoryMonitor() : Boolean
      {
         if(remoter.remoting == _0B_2._1X_3)
         {
            return console.panels.memoryMonitor;
         }
         return this._1j6 != null;
      }
      
      public function set memoryMonitor(param1:Boolean) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:int = 0;
         if(remoter.remoting == _0B_2._1X_3)
         {
            _loc2_ = new ByteArray();
            _loc2_.writeBoolean(param1);
            remoter.send("mem",_loc2_);
         }
         else if(param1 != this.memoryMonitor)
         {
            if(param1)
            {
               this._1j6 = this._1M___(_1H_v._06g);
               this._1j6._tE_ = 20;
            }
            else
            {
               _loc3_ = this._1fB_.indexOf(this._1j6);
               if(_loc3_ >= 0)
               {
                  this._1fB_.splice(_loc3_,1);
               }
               this._1j6 = null;
            }
            console.panels.mainPanel.updateMenu();
         }
      }
      
      private function _1M___(param1:int) : _1H_v
      {
         var _loc2_:_1H_v = new _1H_v("special");
         _loc2_.type = param1;
         this._1fB_.push(_loc2_);
         var _loc3_:_U_j = new _U_j("special");
         if(param1 == _1H_v._1C_F_)
         {
            _loc3_.col = 16724787;
         }
         else
         {
            _loc3_.col = 5267711;
         }
         _loc2_.interests.push(_loc3_);
         return _loc2_;
      }
      
      public function update(param1:Number = 0) : Array
      {
         var _loc2_:_U_j = null;
         var _loc3_:Number = NaN;
         var _loc4_:_1H_v = null;
         var _loc5_:Boolean = false;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:uint = 0;
         var _loc12_:ByteArray = null;
         var _loc13_:uint = 0;
         for each(_loc4_ in this._1fB_)
         {
            _loc5_ = true;
            if(_loc4_._tE_ > 1)
            {
               _loc4_._1vS_++;
               if(_loc4_._1vS_ < _loc4_._tE_)
               {
                  _loc5_ = false;
               }
               else
               {
                  _loc4_._1vS_ = 0;
               }
            }
            if(_loc5_)
            {
               _loc6_ = _loc4_.type;
               _loc7_ = _loc4_._1kl;
               _loc8_ = _loc4_.interests;
               if(_loc6_ == _1H_v._1C_F_)
               {
                  _loc4_._k4 = param1;
                  _loc2_ = _loc8_[0];
                  _loc9_ = getTimer();
                  if(this._05__ >= 0)
                  {
                     _loc10_ = _loc9_ - this._05__;
                     _loc3_ = 1000 / _loc10_;
                     _loc2_.setValue(_loc3_,_loc7_);
                  }
                  this._05__ = _loc9_;
               }
               else if(_loc6_ == _1H_v._06g)
               {
                  _loc2_ = _loc8_[0];
                  _loc3_ = Math.round(System.totalMemory / 10485.76) / 100;
                  _loc4_._tb(_loc3_);
                  _loc2_.setValue(_loc3_,_loc7_);
               }
               else
               {
                  this._T_K_(_loc4_);
               }
            }
         }
         if(remoter.canSend && (this._0iI_ || this._1fB_.length))
         {
            _loc11_ = this._1fB_.length;
            _loc12_ = new ByteArray();
            _loc13_ = 0;
            while(_loc13_ < _loc11_)
            {
               _1H_v(this._1fB_[_loc13_])._0X_E_(_loc12_);
               _loc13_++;
            }
            remoter.send("graph",_loc12_);
            this._0iI_ = this._1fB_.length > 0;
         }
         return this._1fB_;
      }
      
      private function _T_K_(param1:_1H_v) : void
      {
         var i:_U_j = null;
         var v:Number = NaN;
         var group:_1H_v = param1;
         for each(i in group.interests)
         {
            try
            {
               v = i._tq();
               i.setValue(v,group._1kl);
            }
            catch(e:Error)
            {
               report("Error with graph value for key [" + i.key + "] in [" + group.name + "]. " + e,10);
               remove(group.name,i.obj,i.prop);
            }
            group._tb(v);
         }
      }
      
      private function _0cb(param1:ByteArray = null) : void
      {
         var _loc2_:Array = null;
         if(param1 && param1.length)
         {
            param1.position = 0;
            _loc2_ = new Array();
            while(param1.bytesAvailable)
            {
               _loc2_.push(_1H_v._lD_(param1));
            }
            console.panels.updateGraphs(_loc2_);
         }
         else
         {
            console.panels.updateGraphs(new Array());
         }
      }
   }
}
