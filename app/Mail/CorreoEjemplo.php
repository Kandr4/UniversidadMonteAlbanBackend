<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class CorreoEjemplo extends Mailable
{
    use Queueable, SerializesModels;

    public $asunto;
    public $mensaje;

    /**
     * Create a new message instance.
     */
    public function __construct($asunto, $mensaje)
    {
        $this->asunto = $asunto;
        $this->mensaje = $mensaje;
    }

    public function build()
    {
        return $this->subject($this->asunto)->view('emails.correo_ejemplo');
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Correo Ejemplo',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'view.name',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
