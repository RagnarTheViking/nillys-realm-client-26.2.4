package _1Z_i
{
   import _1kz.ICommandCenter;
   import flash.utils.Dictionary;
   import _J_4._U_D_;
   import _J_4._1I_J_;
   import _1kz._1a9;
   
   public class _cp implements ICommandCenter
   {
       
      
      private const _0xT_:Dictionary = new Dictionary();
      
      private const _Y_3:_U_D_ = new _0sz();
      
      public function _cp()
      {
         super();
      }
      
      public function map(param1:_1a9) : _1I_J_
      {
         return this._0xT_[param1] = this._0xT_[param1] || new _12__(param1);
      }
      
      public function _1kw(param1:_1a9) : _U_D_
      {
         return this._0xT_[param1] || this._Y_3;
      }
   }
}
