package _W_Q_
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0hJ_.Server;
   
   public class _B_3 extends Sprite
   {
       
      
      private var _N_X_:Vector.<_W_Q_.ServerBox>;
      
      public function _B_3(param1:Vector.<Server>)
      {
         var _loc2_:_W_Q_.ServerBox = null;
         var _loc3_:int = 0;
         var _loc4_:Server = null;
         this._N_X_ = new Vector.<_W_Q_.ServerBox>();
         super();
         _loc2_ = new _W_Q_.ServerBox(null);
         _loc2_.setSelected(true);
         _loc2_.x = _W_Q_.ServerBox.WIDTH / 2 + 2;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addChild(_loc2_);
         this._N_X_.push(_loc2_);
         _loc3_ = 2;
         for each(_loc4_ in param1)
         {
            _loc2_ = new _W_Q_.ServerBox(_loc4_);
            if(_loc4_.name == Parameters.data_.preferredServer)
            {
               this.setSelected(_loc2_);
            }
            _loc2_.x = _loc3_ % 2 * (_W_Q_.ServerBox.WIDTH + 4);
            _loc2_.y = int(_loc3_ / 2) * (_W_Q_.ServerBox.HEIGHT + 4);
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            addChild(_loc2_);
            this._N_X_.push(_loc2_);
            _loc3_++;
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:_W_Q_.ServerBox = param1.target as _W_Q_.ServerBox;
         if(_loc2_ == null)
         {
            return;
         }
         this.setSelected(_loc2_);
         Parameters.data_.preferredServer = _loc2_.value_;
         Parameters.save();
      }
      
      private function setSelected(param1:_W_Q_.ServerBox) : void
      {
         var _loc2_:_W_Q_.ServerBox = null;
         for each(_loc2_ in this._N_X_)
         {
            _loc2_.setSelected(false);
         }
         param1.setSelected(true);
      }
   }
}
