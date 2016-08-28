package _1__H_
{
   import flash.display.Sprite;
   import _P_N_._1ay;
   import com.company.assembleegameclient.util._A_o;
   
   public class _M_t extends Sprite implements _1ay
   {
       
      
      public var _1gH_:_A_o;
      
      public function _M_t()
      {
         super();
         this._1gH_ = new _A_o(this);
      }
      
      protected function _9s() : void
      {
         this.x = (this._1gH_._05C_() - this.width) * 0.5;
         this.y = (this._1gH_._0P_C_() - this.height) * 0.5;
      }
   }
}
