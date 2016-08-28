package _18
{
   import flash.display.DisplayObjectContainer;
   
   public class _0fG_
   {
       
      
      public var target:DisplayObjectContainer;
      
      private var _1iX_:_18._qP_;
      
      private var _1Z_:_18._qP_;
      
      public function _0fG_()
      {
         super();
      }
      
      public function shift() : void
      {
         this.target.removeChild(this._1iX_);
         this._1iX_ = this._1iX_.next;
         if(this._1iX_)
         {
            this.target.addChild(this._1iX_);
         }
         else
         {
            this._1Z_ = null;
         }
      }
      
      public function append(param1:_18._qP_) : void
      {
         param1.list = this;
         if(this._1Z_)
         {
            this._1Z_.next = param1;
            this._1Z_ = param1;
         }
         else
         {
            this._1iX_ = this._1Z_ = param1;
            this.target.addChild(param1);
         }
      }
   }
}
