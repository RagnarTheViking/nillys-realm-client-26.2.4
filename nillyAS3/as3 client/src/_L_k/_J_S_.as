package _L_k
{
   import _1kz._1a9;
   import _1kz._0gB_;
   import _1Z_i._0ba;
   import flash.events.IEventDispatcher;
   import flash.utils.describeType;
   import _wi.Injector;
   
   public class _J_S_ implements _1a9
   {
       
      
      private const _A_2:Vector.<_0gB_> = new Vector.<_0gB_>();
      
      private const _034:_0ba = new _0ba();
      
      private var _0gL_:IEventDispatcher;
      
      private var _15:String;
      
      private var _6H_:_L_k._U_b;
      
      public function _J_S_(param1:Injector, param2:IEventDispatcher, param3:String, param4:Class = null)
      {
         super();
         this._0gL_ = param2;
         this._15 = param3;
         this._6H_ = new _L_k._U_b(this,this._034,param1,param4);
      }
      
      public function _0N_x(param1:_0gB_) : void
      {
         this._1C_8(param1);
         if(this._034._1Z_)
         {
            this._034._1Z_.next = param1;
         }
         else
         {
            this._034._1iX_ = param1;
            this._1wp();
         }
      }
      
      public function _rS_(param1:_0gB_) : void
      {
         this._034.remove(param1);
         if(!this._034._1iX_)
         {
            this._0A_s();
         }
      }
      
      private function _1C_8(param1:_0gB_) : void
      {
         var mapping:_0gB_ = param1;
         if(describeType(mapping.commandClass).factory.method.(@name == "execute").length() == 0)
         {
            throw new Error("Command Class must expose an execute method");
         }
      }
      
      private function _1wp() : void
      {
         this._0gL_.addEventListener(this._15,this._6H_.execute);
      }
      
      private function _0A_s() : void
      {
         this._0gL_.removeEventListener(this._15,this._6H_.execute);
      }
   }
}
