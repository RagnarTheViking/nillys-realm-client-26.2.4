package _gs
{
   import _1kz._1a9;
   import _1kz._0gB_;
   import _f7._03i;
   import _wi.Injector;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import _I_w.guardsApprove;
   import _I_w.applyHooks;
   
   public class _1O_p implements _1a9
   {
       
      
      private const _A_2:Vector.<_0gB_> = new Vector.<_0gB_>();
      
      private var _signal:_03i;
      
      private var _0R_V_:Class;
      
      private var _once:Boolean;
      
      protected var _A_A_:Injector;
      
      protected var _1H_L_:Dictionary;
      
      protected var _8Q_:Dictionary;
      
      public function _1O_p(param1:Injector, param2:Class, param3:Boolean = false)
      {
         super();
         this._A_A_ = param1;
         this._0R_V_ = param2;
         this._once = param3;
         this._1H_L_ = new Dictionary(false);
         this._8Q_ = new Dictionary(false);
      }
      
      public function _0N_x(param1:_0gB_) : void
      {
         this._1C_8(param1);
         this._A_2.push(param1);
         if(this._A_2.length == 1)
         {
            this._T_y(param1.commandClass);
         }
      }
      
      public function _rS_(param1:_0gB_) : void
      {
         var _loc2_:int = this._A_2.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._A_2.splice(_loc2_,1);
            if(this._A_2.length == 0)
            {
               this._0U_K_(param1.commandClass);
            }
         }
      }
      
      protected function _1C_8(param1:_0gB_) : void
      {
         var mapping:_0gB_ = param1;
         if(this._8Q_[mapping.commandClass])
         {
            return;
         }
         if(describeType(mapping.commandClass).factory.method.(@name == "execute").length() == 0)
         {
            throw new Error("Command Class must expose an execute method");
         }
         this._8Q_[mapping.commandClass] = true;
      }
      
      protected function _0L_1(param1:_03i, param2:Array, param3:Class, param4:Boolean) : void
      {
         var _loc5_:_0gB_ = null;
         var _loc6_:Boolean = false;
         var _loc7_:Object = null;
         var _loc8_:Vector.<_0gB_> = this._A_2.concat();
         for each(_loc5_ in _loc8_)
         {
            this._s__(param1.valueClasses,param2);
            _loc6_ = guardsApprove(_loc5_._P_O_,this._A_A_);
            if(_loc6_)
            {
               this._once && this._rS_(_loc5_);
               this._A_A_.map(_loc5_.commandClass).asSingleton();
               _loc7_ = this._A_A_.getInstance(_loc5_.commandClass);
               applyHooks(_loc5_._1P_S_,this._A_A_);
               this._A_A_._1kw(_loc5_.commandClass);
            }
            this._F_U_(param1.valueClasses,param2);
            if(_loc6_)
            {
               _loc7_.execute();
            }
         }
         if(this._once)
         {
            this._0U_K_(param3);
         }
      }
      
      protected function _s__(param1:Array, param2:Array) : void
      {
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            this._A_A_.map(param1[_loc3_])._1as(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function _F_U_(param1:Array, param2:Array) : void
      {
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            this._A_A_._1kw(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      protected function _1cZ_(param1:_03i, param2:Class) : Boolean
      {
         var _loc3_:Dictionary = this._1H_L_[param1];
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc4_:Function = _loc3_[param2];
         return _loc4_ != null;
      }
      
      private function _T_y(param1:Class) : void
      {
         var commandClass:Class = param1;
         if(this._1cZ_(this._signal,commandClass))
         {
            return;
         }
         this._signal = this._A_A_.getInstance(this._0R_V_);
         this._A_A_.map(this._0R_V_)._1as(this._signal);
         var signalCommandMap:Dictionary = this._1H_L_[this._signal] = this._1H_L_[this._signal] || new Dictionary(false);
         var callback:Function = function():void
         {
            _0L_1(_signal,arguments,commandClass,_once);
         };
         signalCommandMap[commandClass] = callback;
         this._signal.add(callback);
      }
      
      private function _0U_K_(param1:Class) : void
      {
         var _loc2_:Dictionary = this._1H_L_[this._signal];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Function = _loc2_[param1];
         if(_loc3_ == null)
         {
            return;
         }
         this._signal.remove(_loc3_);
         delete _loc2_[param1];
      }
   }
}
