package _05L_
{
   import flash.geom.Rectangle;
   
   public class _05T_
   {
       
      
      public var chat:Rectangle;
      
      public var _A_x:int;
      
      public var _eS_:int;
      
      public var _C_q:int;
      
      public var _1i3:Vector.<_05L_.ChatMessage>;
      
      public function _05T_()
      {
         this._1i3 = new Vector.<_05L_.ChatMessage>();
         super();
         this.chat = new Rectangle(0,0,600,300);
         this._A_x = 20;
         this._eS_ = 10;
         this._C_q = 150;
      }
      
      public function _1vd(param1:_05L_.ChatMessage) : void
      {
         this._1i3.push(param1);
         if(this._1i3.length > this._C_q)
         {
            this._1i3.shift();
         }
      }
   }
}
